enum RouteCategory {
  splash,
  loading,
}

extension Extentions on RouteCategory {
  String get path {
    switch (this) {
      case RouteCategory.splash:
        return "/splash";
      case RouteCategory.loading:
        return "/loading";
      default:
        return "/";
    }
  }

  String get name {
    switch (this) {
      case RouteCategory.splash:
        return "splash";
      case RouteCategory.loading:
        return "loading";
      default:
        return "home";
    }
  }
}
