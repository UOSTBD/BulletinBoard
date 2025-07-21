import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/**/*.{js,ts,jsx,tsx,mdx}', // src 디렉토리를 사용하는 경우 (현재 구조에 해당)
  ],
  theme: {
    extend: {
      // 여기에 사용자 정의 테마를 추가할 수 있습니다.
    },
  },
  plugins: [],
};

export default config;