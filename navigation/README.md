# Navigation


Gio Router ( https://github.com/gioui/gio/tree/main/io/router ) and GIO X Component ( gioui.org/x/component) provide the basis, but we dont have the other things needed to build compelling apps.

The following feature matrix make up the whole of that experience.

Each section below is reasonably ordered in that one cant be done unless the previous one is done.

**Table of contents**

- [manifests](#Manifests)
- [URL handling](#url-handling)
- [Deeplinking](#deeplinking)
- [Universal Links](#universal-links)
- [Share](#share)
- [Providence](#providence)

## Manifests

With these features, you also have a fair bit of configuration required in the Manifests that are particular to each compile target.

For Web a Service work manifest is needed.

For Desktop and Mobile the Manifests need to have the needed items.



## URL handling

For Web its having URL's map to Pages.

As the User Navigates within the app the URL in the Omni bar changes.

You end up with 2 back buttons. One in the browser and one in the App, and they both do exactly the same thing. 

Use cases:

- It allows users to change pages via URL, copy, paste, share an URL with another user so they can go directly to that page.

Providence:

- Flutter Info: https://flutter.dev/docs/development/ui/navigation/url-strategies

Examples:

- Web : https://vrouter.dev/

- Code: https://github.com/lulupointu/vrouter


## Deeplinking

This is a Navigation overlay that maps to the Pages inside the app.

Its different from Url Handling, because it works cross platform.

Use cases:

- Typically used with Notifications, so that from clicking on the notification, it opens the app and take the user into the Page in the app.

Flutter info: https://flutter.dev/docs/development/ui/navigation/deep-linking

Video Demo: https://user-images.githubusercontent.com/53147028/132381138-238ef02a-367d-4f98-aa8a-80a119575dab.MP4

## Universal Links

  - If you have a Native version of the App, then it will laod up the Native version. If not it will laod up the Web version. This uses UrlSchemes
  - IOS: https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
  - Android: https://developer.android.com/training/app-links/deep-linking

## Share

This means we need to share a URI, so that it can then used by the recieving app to load up the thing your sharing.
  - For a Link to a GIO Page to resolve, you need the Deep Link and Univrsal Links working





## Providence

Router designed for SPA 

https://github.com/mitranim/rout is an imperitive router that uses the builder pattern. Most routers have a separation between "building" the routes and using the routes. rout doesn't have that. It doesn't "build" routes, it just runs.

JS usage of rout helps to see its intent ...
https://github.com/mitranim/imperouter,

https://github.com/mitranim/prax 
