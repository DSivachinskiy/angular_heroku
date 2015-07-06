angular.module('Todo')
.controller('MainCtrl', [
'$scope','lists',
function($scope, lists){
  
  $scope.lists = lists.lists;
 $scope.addList = function(){
   if(!$scope.title || $scope.title === '') { return; }
   lists.create({title: $scope.title, 
   });
   $scope.title = '';
  
};
  $scope.incrementUpvotes = function(list, task) {
  lists.upvoteTask(list, task);
};
$scope.decrementUpvotes = function(list, task) {
  lists.downvoteTask(list, task);
};
$scope.addTask = function(list, body){
  if(body === '') { return; }
  lists.addTask(list.id, {
    body: body,
    author: 'user',
  }).success(function(task) {
    list.tasks.push(task);
  });
  body = '';
};

$scope.updateTask= function(list, task, body){
lists.updateTask(list.id, task.id, {body: body}).success(function() {
    lists.getAll();
  });
};
$scope.updateList= function(list, title){

lists.updateList(list.id, {title: title}).success(function() {
    lists.getAll();
  });
};

$scope.deleteTask = function(list, task){
  
  lists.delTask(list, task).success(function() {
    lists.getAll();
  });
 
};
$scope.deleteList = function(list){
  
  lists.delList(list).success(function(){
  lists.getAll();
 });
};
}]);