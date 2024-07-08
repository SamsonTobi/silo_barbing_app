# HNG Stage 2 Task

This Flutter project is a barbing app for Silo Homebarbing Service that uses a `GET /products` endpoint to present a list of haircuts, their details, and prices from the `Timbu API` (https://docs.timbu.cloud/api/intro). It illustrates how to call an API properly (My first attempt).


## As part of the requirements: 
- The app uses a proper state management (`BLoC`).
- I implemented a `ListView.separated` widget consisting of some `SkeletonListItem` emitted by a `HaircutsFetchingLoadingState` state to represent incoming data better.
- Proper error handling was implemented using `Exceptions` and emits a `HaircutsFetchingErrorState` state using `BLoC` that displays an error widget.
- For a better user experience, I used a package (`cached_network_image`) to prevent fetching the same images multiple times.



You can see a virtualized demonstration of the release version of my app using `Appetize.io` here:
