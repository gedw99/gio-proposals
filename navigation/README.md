# Navigation

Gio Route and GIO Component provide the basis.

Need to add :

- Deeplink. This means that we need a Navigation overlay that them maps to the Routes inside the app.
  - A simple proof of this is that the URL in the web Ombi bar changes as you navigate, and you can cut and paste it into another browser Window

- Universal Links
  - If you have a Native version of the App, then it will laod up the Native version. If not it will laod up the Web version. This uses UrlSchemes
  - IOS: https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
  - Android: https://developer.android.com/training/app-links/deep-linking

- Share. This means we need to share a URI, so that it can then used by the recieving app to load up the thing your sharing.
  - For a Link to a GIO Page to resolve, you need the Deep Link and Univrsal Links working

- Manifests
    - For Web a Service work manifest is needed.
    - For Desktop and Mobile the Manifests need to have the needed items.
