module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: ['Noto Sans JP', 'sans-serif']
      },
    },
    color: theme => ({
      ...theme('colors'),
      'primary': '#6C6AD2',
    }),
    textColor: theme => ({
      ...theme('colors'),
      'primary': '#6C6AD2',
    }),
    borderColor: theme => ({
      ...theme('colors'),
      'primary': '#6C6AD2',
    }),
    backgroundImage: theme => ({
      ...theme('colors'),
      'primary': 'linear-gradient(93.63deg, #7775D7 0%, #A775FF 100%)',
    }),
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
