# GNOME CONTACTS

Swift app implemented using VIPER architecture and Auto Layout. Go to [Statement](#statement) to see the requirements of the activity.

<br>
<p align="center">
<img src="https://raw.githubusercontent.com/joanroig/GnomeContactsVIPER/master/Assets/list.png " width="250">
<img src="https://raw.githubusercontent.com/joanroig/GnomeContactsVIPER/master/Assets/listcategory.png" width="250">
<img src="https://raw.githubusercontent.com/joanroig/GnomeContactsVIPER/master/Assets/detail.png" width="250">
</p>
<br>

## Features

- Control over network errors with user-friendly popups.
- UI not blocked by network operations.
- List with dynamic heights on each row for showing the name in two lines if needed (useful on small devices).
- List with filter and name searcher.
- Word randomier and genre generator implemented for all gnomes.
- The entity structure is prepared for more than one city (but views will need some changes).
- Usage of Codable for mapping entities with JSON data.
- Beautiful background for cells and for the whole detailed view showing each gnome's hair color.

## Libraries

- [Kingfisher](https://github.com/onevcat/Kingfisher): Used for downloading and caching images from the web.
- [Color hex converter](https://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string): Used for easily convert hexa colors to iOS colors.

## Test

The current test checks the list view internal interaction between all of its components.
I've decided to implement this test for ensuring that the internal communication is robust on every change.
The key point of this test is checking the JSON deserialize with mocked data, it will be helpful if the JSON structure needs to be changed.

## Improvements

The major improvement of this project will be adding a split view controller.

## Statement
```
Our team is playing a fantasy role-playing game and every time the heroes they play arrive at a town, they have the issue they don't know the local population and what they can do to help them on their adventures.

This is one of these times, our heroes just arrived at a Gnome town called Brastlewark. To facilitate trade with the local population they need an easy way to browse all the inhabitants details. We've found a server providing all the census data of Brastlewark at the following address:

https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json

Gnomes in this town are not really social because they have too much work to do. That's the reason they can have more than one job and might have few or even no friends at all. They also appreciate their privacy so they've used some random images from internet, not specifically optimized for mobile devices, for their profile. (They are very modern in some aspects and they have smartphones and access to internet for instance).

Please write an Android / iOS / Hybrid application to help our team browse and be able to see the details of those inhabitants.

Specifications:
- Retrieve data from the URL provided
- Show this data in the most user-friendly way you could think. Keep in mind our heroes will be quite busy dealing with Orcs, so apps have to be really simple and easy to use. At least would be good to quickly browse (and even filter) all the individuals and be able to see the details of each one.
- Document all libraries used and explain the reason you’ve used that library.
- Test the app: add the most important test you think it is needed.


Bonus:
- Be creative!
- UI must not blocked by network connections or long operations
- Images coming from network cached to improve performance
- Error handling
- Avoid using third party libraries for basic functionality (we want to see you know the basics!)
- Use third party libraries for extended functionality
- Snappiness & responsiveness over sluggishness & idleness
- Determine gender of gnomes (just joking on this one but feel free to make your guess)
- Test the app
```

## Copyright

Icons from FlatIcon.

Copyright © 2018 Joan Roig.
