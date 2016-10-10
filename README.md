# Domicilios.com

Use the `Domicilios.com.workspace` file to open the project. Opening the AFNetworking or the Domicilios.com project will not run the actual application.

## User interface design

[Design wireframe on Figma](https://www.figma.com/file/L0GcMnPspSFjtlPjPRQrMjtJ/Wireframes)

## Objective-C library

The StyleKit was composed with [PaintCode](https://www.paintcodeapp.com) and bound into the project using [Xcode Bridging-Header.h model](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html).
StyleKit is a visual implementation of the interface images and assets using CoreGraphics and UIKit to avoid reloading and pixel-density targeting of assets.

The bottomline is the the assets are completely Git-friendly, the colors are consistent and instanciable throughout the project and there is no heavy Assets.xcassets footprint for items that do not need it.

## Third-party

In spite of not needing any third-party elements to compose this app, it was requires by the specification.
The [AFNetworking](https://github.com/AFNetworking/AFNetworking) framework was selected to handle synchronous call for the JSON dependencies as well as for the *favicon* images — which, by the way, have their links broken and were replaced by a placeholder on the actual UI.
