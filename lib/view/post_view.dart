import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task3/controller/post_controller.dart';

class PostView extends StatelessWidget {
   PostView({super.key});

      final PostController controller = Get.put(PostController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,

    ),
    body: Obx((){
      if(controller.isLoading.value){
        return const Center(child: CircularProgressIndicator(),);
      }
      if(controller.posts.isEmpty){
        return const Center(child: Text('No posts available'),);
      }

      return ListView.separated(
        separatorBuilder: (context, index)=> Divider(height: 1,),

        itemCount: controller.posts.length,

        itemBuilder:(context, index){

        final post = controller.posts[index];

        return ListTile(
          title: Text(post.title),
          subtitle:Text(post.body),
          leading: CircleAvatar(child: Text(post.id.toString()),),
      
          );
    });
    
    }
    ));
  }
}