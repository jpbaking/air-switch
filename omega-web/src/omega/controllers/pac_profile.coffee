angular.module('omega').controller 'PacProfileCtrl', ($scope, $modal) ->
  set = OmegaPac.Profiles.referencedBySet($scope.profile, $scope.options)
  $scope.referenced = Object.keys(set).length > 0

  $scope.editProxyAuth = (scheme) ->
    prop = 'all'
    auth = $scope.profile.auth?[prop]
    scope = $scope.$new('isolate')
    scope.auth = auth && angular.copy(auth)
    $modal.open(
      templateUrl: 'partials/fixed_auth_edit.html'
      scope: scope
      size: 'sm'
    ).result.then (auth) ->
      if not auth?.username
        if $scope.profile.auth
          $scope.profile.auth[prop] = undefined
      else
        $scope.profile.auth ?= {}
        $scope.profile.auth[prop] = auth
