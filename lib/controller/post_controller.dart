
import 'package:get/get.dart';
import 'package:task3/model/post_model.dart';
import 'package:task3/services/post_services.dart';

class PostController extends GetxController{
  final PostServices service = PostServices();

  final posts = <PostModel>[].obs;
    final  isLoading = true.obs;

    @override 
     void onInit() {
       super.onInit();
        getPosts(); }

  
  Future<RxList<PostModel>> getPosts() async { 

    try{
      isLoading.value = true;
      /// Fetch data from API
      posts.value= await service.fetchPosts();
      return posts;

    }catch(e){
      /// Error message
      throw Exception('Failed to load data: $e');
    }
    finally{
      isLoading.value= false;
    }

  }
  
  }