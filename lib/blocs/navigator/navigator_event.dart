part of 'navigator_bloc.dart';

abstract class NavigatorEvent {}

class LandingScreenEvent extends NavigatorEvent {}

class LoginScreenEvent extends NavigatorEvent {}

class LoadingScreenEvent extends NavigatorEvent {}

class HomeScreenEvent extends NavigatorEvent {}

class LogoutScreenEvent extends NavigatorEvent {}
