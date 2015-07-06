angular.module('Todo')
.factory('lists', [
'$http',
function($http){
  var o = {
    lists: []
  };
  o.getAll = function() {
    return $http.get('/lists.json').success(function(data){
      angular.copy(data, o.lists);
    });
  };
  o.create = function(list) {
  return $http.post('/lists.json', list).success(function(data){
    window.location.reload();
    
  });
};
o.delList = function(list) {
  return $http.delete('/lists/' + list.id + '/destroy.json');
  
};
o.updateList = function(id, title) {
 return $http.put('/lists/' + id + '/update.json', title);
};
o.delTask = function(list, task) {
  return $http.delete('/lists/' + list.id + '/tasks/'+ task.id + '/destroy.json');
};
o.updateTask = function(id, taskId, body) {
 return $http.put('/lists/' + id + '/tasks/'+ taskId + '/update.json', body);
};
o.get = function(id) {
  return $http.get('/lists/' + id + '.json').then(function(res){
    return res.data;
  });
};
o.addTask = function(id, task) {
  return $http.post('/lists/' + id + '/tasks.json', task);
};
o.upvoteTask = function(list, task) {
  return $http.put('/lists/' + list.id + '/tasks/'+ task.id + '/upvote.json')
    .success(function(data){
      task.upvotes += 1;
    });
};
o.downvoteTask = function(list, task) {
  return $http.put('/lists/' + list.id + '/tasks/'+ task.id + '/upvote.json')
    .success(function(data){
      task.upvotes -= 1;
    });
};
  return o;
}]);