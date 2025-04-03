

abstract class OneBillonStates {}

class SIGInitialState extends OneBillonStates {}

class SIGChangeBottomNavBarState extends OneBillonStates {}

class SIGSearchAlertState extends OneBillonStates {}

class SIGLoadingHomeDataState extends OneBillonStates {}

class StratSendUserDataState extends OneBillonStates {}

class SendUserDataSuccessState extends OneBillonStates {}

class SendUserDataErrorState extends OneBillonStates {}

class LogOutState extends OneBillonStates {}


class AccountDeleteSuccessState extends OneBillonStates {}

class SIGGetServiceSectionsState extends OneBillonStates {}


class AccountDeleteErrorState extends OneBillonStates {}
// class SIGHomeDataSuccessState extends OneBillonStates {
//   final UnitResponse unitResponse;
//   SIGHomeDataSuccessState(this.unitResponse);
// }

class SIGLoadingProjectsHomeDataState extends OneBillonStates {}

class SIGProjectsHomeDataSuccessState extends OneBillonStates {}

class SIGProjectsHomeDataErrorState extends OneBillonStates {}

class SIGLoadingMostPopularCitiesState extends OneBillonStates {}

class SIGMostPopularCitiesSuccessState extends OneBillonStates {}

class SIGMostPopularCitiesErrorState extends OneBillonStates {}

class SIGLoadingMostPopularProjectsState extends OneBillonStates {}

class SIGMostPopularProjectsSuccessState extends OneBillonStates {}

class SIGMostPopularProjectsErrorState extends OneBillonStates {}

class SIGLoadingCategoriesState extends OneBillonStates {}

class SIGCategoriesSuccessState extends OneBillonStates {}

class SIGCategoriesErrorState extends OneBillonStates {}

class SIGHomeDataErrorState extends OneBillonStates {}

class SIGChangeDescriptionState extends OneBillonStates {}

class SIGChangePropertyDetailsState extends OneBillonStates {}

class SIGChangeFeaturesState extends OneBillonStates {}

class SIGChangeFloorPlanState extends OneBillonStates {}

class SIGChangePropertyVideoState extends OneBillonStates {}

class SIGChangeVideoPlayer extends OneBillonStates {}

class SIGChangeVideoState extends OneBillonStates {}

class SIGFilterDataState extends OneBillonStates {}

class SIGLoadingFilterByManyPropsState extends OneBillonStates {}

class SIGSuccessFilterByManyPropsState extends OneBillonStates {}

class SIGErrorFilterByManyPropsState extends OneBillonStates {}

class SIGFilterDataLoadingState extends OneBillonStates {}

class SIGFilterDataSuccessState extends OneBillonStates {}

class SIGFilterDataErrorState extends OneBillonStates {}

class SIGNavigateToSearchState extends OneBillonStates {}

class UpdatedDropDownState extends OneBillonStates {}

class FilterAppliedState extends OneBillonStates {}

class FilterLoadingState extends OneBillonStates {}

class FilterSuccessState extends OneBillonStates {}

class FilterErrorState extends OneBillonStates {}

class RestAllFieldsState extends OneBillonStates {}

class CatIDState extends OneBillonStates {}

class SIGRemoveTokenState extends OneBillonStates {}

class CityIDState extends OneBillonStates {}

class ProfileLoadingState extends OneBillonStates {}

// class ProfileSuccessState extends OneBillonStates {
//   final ProfileModel? profile;

//   ProfileSuccessState({required this.profile});
// }

class ProfileErrorState extends OneBillonStates {
  final String error;

  ProfileErrorState(this.error);
}

class EditProfileLoadingState extends OneBillonStates {}

// class EditProfileSuccessState extends OneBillonStates {
//   final UpdateProfileModel? updateProfileModel;

//   EditProfileSuccessState(this.updateProfileModel);
// }

class EditProfileErrorState extends OneBillonStates {
  final String error;

  EditProfileErrorState(this.error);
}

class UpdatePasswordLoadingState extends OneBillonStates {}

// class UpdatePasswordSuccessState extends OneBillonStates {
//   final UpdatePasswordModel? updatePasswordModel;

//   UpdatePasswordSuccessState(this.updatePasswordModel);
// }

class UpdatePasswordErrorState extends OneBillonStates {
  final String error;

  UpdatePasswordErrorState(this.error);
}

class WishlistErrorState extends OneBillonStates {
  final String error;
  WishlistErrorState(this.error);
}

class WishlistLoadingState extends OneBillonStates {}

class WishlistSuccessState1 extends OneBillonStates {}

class SIGFavoritesErrorState extends OneBillonStates {}

class SIGChangeFavoritesSuccessState extends OneBillonStates {}

class SIGGetBlogsState extends OneBillonStates {}

class SIGGetServicesState extends OneBillonStates {}

// class WishlistSuccessState extends OneBillonStates {
//   FavModelTest? favModelTest;
//   WishlistSuccessState(this.favModelTest);
// }
