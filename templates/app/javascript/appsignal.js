import Appsignal from '@appsignal/javascript';

export const appsignal = new Appsignal({
  key: window.appsignalConfig.frontendApiKey,
});
window.Appsignal = appsignal;
