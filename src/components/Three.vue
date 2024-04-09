<template>
    <div class="webgl-container">
        <canvas class="webgl-canvas" ref="webglCanvas"></canvas>
    </div>
</template>

<script>
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js'
import { DRACOLoader } from 'three/examples/jsm/loaders/DRACOLoader.js'
import GUI from 'lil-gui'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger';

import particlesVertexShader from '../assets/shaders/particles/vertex.glsl'
import particlesFragmentShader from '../assets/shaders/particles/fragment.glsl'

export default {
    name: 'ThreeJsScene',
    mounted() {

        gsap.registerPlugin(ScrollTrigger)
        // Sizes
        const webglContainer = document.querySelector('.webgl-container')

        const sizes = {
            width: webglContainer.offsetWidth,
            height: webglContainer.offsetHeight,
            pixelRatio: Math.min(window.devicePixelRatio, 2)
        }

        // Création de l'animation que vous souhaitez déclencher
        const animation = gsap.to('.webgl-container', {
            xPercent: 50,
            scrollTrigger: {
                trigger: '.webgl-container',
                start: 'top center', // Démarre l'animation lorsque le haut de la fenêtre d'affichage atteint le centre de .webgl-container
                end: 'bottom center', // Arrête l'animation lorsque le bas de la fenêtre d'affichage atteint le centre de .webgl-container
                scrub: 1, // L'animation se synchronise avec le défilement
            }
        });

        // window.addEventListener('resize', () => {
        //     // Update sizes
        //     sizes.width = window.innerWidth
        //     sizes.height = window.innerHeight
        //     sizes.pixelRatio = Math.min(window.devicePixelRatio, 2)

        //     // Update camera
        //     camera.aspect = sizes.width / sizes.height
        //     camera.updateProjectionMatrix()

        //     // Update renderer
        //     renderer.setSize(sizes.width, sizes.height)
        //     renderer.setPixelRatio(sizes.pixelRatio)
        // })

        // Canvas
        const canvas = this.$refs.webglCanvas

        // Scene
        const scene = new THREE.Scene()

        // Loaders
        const dracoLoader = new DRACOLoader()
        dracoLoader.setDecoderPath('./draco/')
        const gltfLoader = new GLTFLoader()
        gltfLoader.setDRACOLoader(dracoLoader)

        // Camera
        const camera = new THREE.PerspectiveCamera(35, sizes.width / sizes.height, 0.1, 100)
        camera.position.set(0, 0, 8 * 2)
        scene.add(camera)

        // Controls
        const controls = new OrbitControls(camera, canvas)
        controls.enableDamping = true

        // Renderer
        const renderer = new THREE.WebGLRenderer({
            canvas: canvas,
            antialias: true,
        })

        renderer.setSize(sizes.width, sizes.height)
        renderer.setPixelRatio(sizes.pixelRatio)

        // Debug
        const gui = new GUI({ width: 340 })
        gui.hide()
        const debugObject = {}

        debugObject.clearColor = '#ffffff'
        gui.addColor(debugObject, 'clearColor').onChange(() => { renderer.setClearColor(debugObject.clearColor) })
        renderer.setClearColor(debugObject.clearColor)

        // Particles
        let particles = null

        gltfLoader.load('./models2.glb', (gltf) => {
            particles = {}
            particles.index = 0
            // log les géométries pour voir les attributs
            gltf.scene.children.map(child => console.log(child))
            const positions = gltf.scene.children.map(child => child.geometry.attributes.position)

            particles.maxCount = 0
            for (const position of positions) {
                if (position.count > particles.maxCount)
                    particles.maxCount = position.count
            }

            particles.positions = []
            for (const position of positions) {
                const originalArray = position.array
                const newArray = new Float32Array(particles.maxCount * 3)

                for (let i = 0; i < particles.maxCount; i++) {
                    const i3 = i * 3

                    if (i3 < originalArray.length) {
                        newArray[i3 + 0] = originalArray[i3 + 0]
                        newArray[i3 + 1] = originalArray[i3 + 1]
                        newArray[i3 + 2] = originalArray[i3 + 2]
                    } else {
                        const randomIndex = Math.floor(position.count * Math.random()) * 3
                        newArray[i3 + 0] = originalArray[randomIndex + 0]
                        newArray[i3 + 1] = originalArray[randomIndex + 1]
                        newArray[i3 + 2] = originalArray[randomIndex + 2]
                    }
                }

                particles.positions.push(new THREE.Float32BufferAttribute(newArray, 3))
            }

            const sizesArray = new Float32Array(particles.maxCount)

            for (let i = 0; i < particles.maxCount; i++)
                sizesArray[i] = Math.random()

            particles.geometry = new THREE.BufferGeometry()
            particles.geometry.setAttribute('position', particles.positions[particles.index])
            particles.geometry.setAttribute('aPositionTarget', particles.positions[3])
            particles.geometry.setAttribute('aSize', new THREE.BufferAttribute(sizesArray, 1))

            particles.colorA = '#000000'
            particles.colorB = '#000000'

            particles.material = new THREE.ShaderMaterial({
                vertexShader: particlesVertexShader,
                fragmentShader: particlesFragmentShader,
                uniforms: {
                    uSize: new THREE.Uniform(0.1),
                    uResolution: new THREE.Uniform(new THREE.Vector2(sizes.width * sizes.pixelRatio, sizes.height * sizes.pixelRatio)),
                    uProgress: new THREE.Uniform(0),
                    uColorA: new THREE.Uniform(new THREE.Color(particles.colorA)),
                    uColorB: new THREE.Uniform(new THREE.Color(particles.colorB))
                },
                blending: THREE.NormalBlending,
                depthWrite: false,
                alphaTest: 0.2,
            })

            particles.points = new THREE.Points(particles.geometry, particles.material)
            particles.points.frustumCulled = false
            particles.points.rotation.y = -(window.scrollY - 450) * 0.001
            scene.add(particles.points)

            particles.morph = (index) => {
                particles.geometry.attributes.position = particles.positions[particles.index]
                particles.geometry.attributes.aPositionTarget = particles.positions[index]

                gsap.fromTo(
                    particles.material.uniforms.uProgress,
                    { value: 0 },
                    { value: 1, duration: 3, ease: 'linear' }
                )

                particles.index = index
            }

            gui.addColor(particles, 'colorA').onChange(() => { particles.material.uniforms.uColorA.value.set(particles.colorA) })
            gui.addColor(particles, 'colorB').onChange(() => { particles.material.uniforms.uColorB.value.set(particles.colorB) })
            gui.add(particles.material.uniforms.uProgress, 'value').min(0).max(1).step(0.001).name('uProgress').listen()

            particles.morph0 = () => { particles.morph(0) }
            particles.morph1 = () => { particles.morph(1) }
            particles.morph2 = () => { particles.morph(2) }
            particles.morph3 = () => { particles.morph(3) }

            gui.add(particles, 'morph0')
            gui.add(particles, 'morph1')
            gui.add(particles, 'morph2')
            gui.add(particles, 'morph3')
        })


        const handleScroll = () => {
            console.log(window.scrollY);
            let scroll = window.scrollY - 450
            particles.points.rotation.y = -scroll * 0.002

            // Modifier également uProgress en fonction de la valeur de défilement
            let progress = (window.scrollY - 700) / 1000; // Adapter la plage de valeurs si nécessaire
            progress = Math.min(Math.max(progress, 0), 1); // Assurer que progress reste entre 0 et 1
            particles.material.uniforms.uProgress.value = progress;
        }

        window.addEventListener('scroll', handleScroll)


        // Animation loop
        const tick = () => {
            controls.update()
            renderer.render(scene, camera)
            requestAnimationFrame(tick)
        }

        tick()
    }
}
</script>

<style scoped>
.webgl-container {
    position: sticky;
    top: 40%;
    /* right: 0%; */
    width: 50vw;
    height: 40vh;
    /* outline: red solid 1px; */
    pointer-events: none;
    transform: translateX(30%);
}

.webgl-canvas {
    width: 100%;
    height: 100%;
    display: block;
}
</style>