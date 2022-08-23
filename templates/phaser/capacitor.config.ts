import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.codesthings.$PROJECT_NAME_TITLE',
  appName: '$PROJECT_NAME_PRETTY',
  webDir: 'www',
  bundledWebRuntime: false,
  backgroundColor: '#3498db',
  loggingBehavior: 'production',
  // Uncomment for livereload
  // server: {
  //   url: 'http://192.168.178.66:8080',
  //   cleartext: true,
  // },
};

export default config;
