varying vec3 vColor;

void main()
{
    vec2 uv = gl_PointCoord - 0.5; // Décalage pour que le centre soit (0,0)
    float distanceToCenter = length(uv);
    float alpha = 1.0 - smoothstep(0.45, 0.5, distanceToCenter); // Utiliser smoothstep pour rendre la transition du bord du cercle plus douce
    alpha = pow(alpha, 4.0); // Appliquer une fonction exponentielle pour réduire davantage la visibilité du contour

    gl_FragColor = vec4(vColor, alpha);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}
