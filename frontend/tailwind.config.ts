module.exports = {
    content: [
        './src/app/**/*.{ts, tsx}',
        './src/components/**/*.{ts, tsx}'
    ],
    dasiyui: {
        themes: ['light', 'dark', 'cupcake'],
    },
    plugins: [require("daisyui")],
}