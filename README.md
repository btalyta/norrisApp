## Norris

Noris is the app to read and share Chuck Norris Facts. You can find new facts using pre-defined categories or by free search.

### Architecture

The architecture used do build app was MPV with Coordinators. Each view was built using view code and your attributes cannot access by others class.
The coordinator is responsible for managing the navigation flow in the app.  The presentation of views is managed by the ViewController.  Already data manipulation, user actions and requests are responsibilities the Presenter.

### Libraries

- SwiftLint: Enforce coding styles
- Quick & Nimble: Unit test
- KIF: To make simple UI tests
