
# Define contract 

- Entity: `notification.dart`

```
class Notification {}
```

- Usecase: `notificaiton_usecase.dart`

```
class NotificationUsecase {
  Future<List<NotificationInfo>> getListNotification(int offset, int limit);
}
```

# ListingBloc
 - [x] Pull to refresh
 - [x] Load more
 - [x] Delete API usecase
 - [x] Update API usecase


 ```
 ListView
 ```

 # Filter by Remote Datasource

### Usecase
 ```
  Future<List<Post>> getPosts({
    required int page,
    required int pageSize,
    required GetPostPayload payload,
  }) {

  }
 ```

 ### Payload 
- Here's an example of filtering by TypeScope.

 ```
 class GetPostPayload with _$GetPostPayload {
  const factory GetPostPayload({
    ...
    List<TypeScope>? typeScope,
  }) = _GetPostPayload;

  factory GetPostPayload.fromJson(Map<String, dynamic> json) =>
      _$GetPostPayloadFromJson(json);
}
 ```
 
 ### use in UI

```
ListViewBuilderWidget<GetPostUserListingBloc, Post, GetPostPayload>.listview(
  param: GetPostPayload(
    feature: widget.feature,
    type: widget.type,
    userId: widget.userId,
    typeScope: widget.typeScope,
    isNews: false,
  ),
  ...
)
```

- By default, when using the ListViewBuilderWidget, it will automatically call the API from the use case without needing to call an event to activate the data. 

- The ListingBloc supports three types for fetching data:
```
TypeFetchPaging.fetch   : dùng cho trường hợp loadmore
TypeFetchPaging.refresh : dùng cho trường hợp pull to refresh
TypeFetchPaging.renew   : dùng cho trường hợp force fectch và load new list item

```

- In case of filtering data from this remote data source, it is required to use fetch type 'TypeFetchPaging.renew'
- To update parameters (used for some cases like filtering data from remote data source), an event should be called for updating.
- We will use this code segment when we need to call the event filter from the interface.
```
  context
    .read<GetPostUserListingBloc>()
    .add(GetListPagingEvent<GetPostPayload, int, int>(
      GetPostPayload(
        feature: widget.feature,
        type: widget.type,
        userId: widget.userId,
        typeScope: widget.typeScope,
        isNews: false,
      ),
      limit: 10,
      offset: 1,
      type: TypeFetchPaging.renew,
    ));
```


