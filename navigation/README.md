# Navigation


Gio Router ( https://github.com/gioui/gio/tree/main/io/router ) and GIO X Component ( gioui.org/x/component) provide the basis, but we dont have the other things needed to build compelling apps.

The following feature matrix make up the whole of that experience.

Each section below is reasonably ordered in that one cant be done unless the previous one is done.

**Table of contents**

- [example](#Example)
- [manifests](#Manifests)
- [URL handling](#url-handling)
- [Deeplinking](#deeplinking)
- [Universal Links](#universal-links)
- [Share](#share)
- [Providence](#providence)

## Example


Here is a typical use case to frame the proposal.

**The First way**

- A doctor makes an appointment for a patient.

- The system sends the patient a email / cal event . It saves the event in the server dB.

- The server has a cal module with cron looping over so that it can fire a notification to the Patient and Doctor when the appointment occurs. 

later on ...

- The server fires the cal event. The cal event notification fires on the patients device, and contaisn some text with an URL like: https://app.domain.org/seasion?id=x

- The patient clicks the URL and the gio app opens, and checks the deep_linking url and then loads up the session initiation page using the X to pull the data from the server that realtes to session X. X coudl be anything. It coudl even just be a token.


**The 2nd way**

Is that on the server the cal event for that patient fires, and the server sends a remote notification via the mobile gateway ( apple or Google ) and on the patients device the notification pop up on on the mobile or desktop and then the same deep linking logic of the First way above occurs.

What I am curious about is how well web notifications work if the user has or has not added the app via A2HS. According to my research it is much more likely to fire IF they are in A2HS.

**Conclusion**

By having the first way and second way, you can cover yourself against the heuristics of  Web Notifcations.


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
