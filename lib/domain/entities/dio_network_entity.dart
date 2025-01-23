class DioExtraOptionsEntities {
  final bool useCache;
  final bool noAuth;
  DioExtraOptionsEntities({
    this.useCache = false,
    this.noAuth = false,
  });

  Map<String, dynamic> toMap() => {
        "use_cache": useCache,
        "no_auth": noAuth,
      };
}
