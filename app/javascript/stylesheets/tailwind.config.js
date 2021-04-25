module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: ['Noto Sans JP', 'sans-serif']
      },
      colors: {
         primary: '#6C6AD2',
         baseGray: '#EDEDED',
         facebook: '#1877F2',
         twitter: '#1D9BF0',
       },
      fontSize: {
        '3.5xl': '2rem',
      },
    },
    // グラデーション
    // backgroundImage: theme => ({
    //   ...theme('colors'),
    //   'primary': 'linear-gradient(93.63deg, #7775D7 0%, #A775FF 100%)',
    // }),
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
