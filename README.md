# HNG Stage 2 Task

This Flutter project is a barbing app for Silo Homebarbing Service that uses a `GET /products` endpoint to present a list of haircuts, their details, and prices from the `Timbu API` (https://docs.timbu.cloud/api/intro). It illustrates how to call an API properly (My first attempt).


## As part of the requirements: 
- The app uses a proper state management (`BLoC`).
- I implemented a `ListView.separated` widget consisting of some `SkeletonListItem` emitted by a `HaircutsFetchingLoadingState` state to represent incoming data better.
- I also used `RefreshIndicator` for a pull to refresh function.
- Proper error handling was implemented using `Exceptions` and emits a `HaircutsFetchingErrorState` state using `BLoC` that displays an error widget.
- For a better user experience, I used a package (`cached_network_image`) to prevent fetching the same images multiple times.

### Video demo
https://github.com/SamsonTobi/silo_barbing_app/assets/64487848/34893489-ee55-4095-a4cc-f14f7c615d09


### App screens
![App screens](https://github.com/SamsonTobi/silo_barbing_app/assets/64487848/820a4772-1e8e-4607-b306-9c38e60169b9)


You can see a virtualized demonstration of the release version of my app using `Appetize.io` here:
[https://appetize.io/app/b_p42kxjpv5fxu3qmycuwvglrzvy](https://appetize.io/app/b_de47emok4zoc5yrw47havcgnja) (Update: It broke, will add a new link here...)

