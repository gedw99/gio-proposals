# gio audio


## Sponsorship 1 - Audio Component.

Make a sponsorship for 100 euro

https://github.com/hajimehoshi/oto v2 looks perfect as a basis.

Just embed a few audio files and play 
check it works on all gio targets ( web, desktop, mobile)


## Sponsorship 2 - Audio Component with Pickers and Players

Use the Gio component (https://github.com/gioui/gio-x/tree/main/component) to navigate to the Use Cases below.

Use cases are:

- Picking via remote server
  - Show a genre textbox or tag cloud to allow the user to select a genre. 
    - Use: Reflect on the genes available at https://unsplash.com/collections/1612951/audio
     - Pick one or many genres
  - Call out to third party for audio files that match the genres represented as URLS. 
  - Display the URL results.
  - Later Display in the Data Table.
 

- Picking via local disk.
  - Pick one or many audio files via file system explorer (https://github.com/gioui/gio-x/tree/main/explorer)
    - Is it fully cross platform ?
    - Does it allow multiple picking.
  
- Display those picked ( above ) in a List. The best List component currently is here: https://github.com/gioverse/chat/tree/main/list
  - TODO: Maybe make List a sponsored Project with a sub set of the things in this Sponsorship ?
  - Show Name, URI ( File or Network), Genre ( if applicable), codec ( can we work it out from the file itself ?)
  - Show actions such as Select ( a toggle ), multi-select ( top action ), Play, Pause, Stop, Fast forward, etc.
  - TODO: This is more like a DataTable. Might be a seperate Project that exteds from the List one in gioverse
  - TODO: Filters and Sorting could be part of the DataTable component.

- Play
  - Follows on from the Display User case above.
  - Opens a Modal to Play.
  - Opens in a new Page to Play.

- Generate sounds
  - biurnal beat that plays through left and right speakers.
  - Save them to Local or Remote Destination.
  - GO back to Picking Use case ....
  
do the work in gio/x

Make it supported so everyone benefits.

## Sponsorship 2

Following on from having the Audio component work, build a Music Playing system.

Make a sponsorship for 100 euro to make a gio based lofimusic.

Code : https://github.com/maxence-charriere/lofimusic
Demo: https://lofimusic.app/lofigirl

- It is built with golang and wasm. So is a good basis.

- Because the Audio component works on all Taregts, this Music Player will work on all platforms, including Mobile.
  - On Mobile it will be interesting if it supports playing in the background. Probably not, and so it may be a New feature of gio needed.

- It uses Service works with a proper manifest, so it supports A2HS and so it can be added to a users Homescreen on Desktop and Mobile, and thus gives an App Store  like UX without needed app store signing.

- It sources the music from youtube, so no server needed.
  - The Gio Audio component will be even better because the user can pick from the file system or the remote server.

- Use Gio Component..

## Providence





