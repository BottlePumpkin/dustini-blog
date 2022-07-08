import 'package:dustini_blog/app/config/size_config.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController chatInputScrollController = ScrollController();
  ScrollController chatListScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 화면'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  controller: chatListScrollController,
                  reverse: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container();
                  }),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //height: 80,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Container(
                        //height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: SizeConfig().screenWidth - 80,
                              child: SingleChildScrollView(
                                controller: chatInputScrollController,
                                child: Scrollbar(
                                  controller: chatInputScrollController,
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 300),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: TextFormField(
                                        maxLines: 4,
                                        minLines: 1,
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                          hintText: '메세지 보내기',
                                          // hintStyle: AppTextStyle.title2R1418
                                          //     .copyWith(color: AppColor.gray500),
                                          border: InputBorder
                                              .none, //const OutlineInputBorder(borderRadius: AppRadius.all8),
                                          //disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(onTap: () {}, child: Icon(Icons.send))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
