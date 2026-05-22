import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



enum MessageType { text, seen }

class ChatMessage {
  final String text;
  final bool isSent;
  final String time;
  final bool isSeen;
  final List<String>? seenAvatars; 

  const ChatMessage({
    required this.text,
    required this.isSent,
    required this.time,
    this.isSeen = false,
    this.seenAvatars,
  });
}



class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> _messages = [
    const ChatMessage(
      text: 'Hello! Thank you for applying to our CNA position.',
      isSent: false,
      time: '10:30 AM',
    ),
    const ChatMessage(
      text: 'We reviewed your application and would like to schedule an interview.',
      isSent: false,
      time: '10:30 AM',
    ),
    const ChatMessage(
      text: 'Thank you so much! I would be happy to come in for an interview.',
      isSent: true,
      time: '10:30 AM',
      isSeen: true,
    ),
    const ChatMessage(
      text: 'Thank you so much! I would be happy to come in for an interview.',
      isSent: true,
      time: '10:30 AM',
      isSeen: true,
      
    ),
    const ChatMessage(
      text: 'How about this Thursday at 2:00 PM?',
      isSent: false,
      time: '10:30 AM',
    ),
    const ChatMessage(
      text: 'Please bring your CNA certification and resume.',
      isSent: false,
      time: '10:30 AM',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isSent: true,
        time: TimeOfDay.now().format(context),
      ));
    });
    _controller.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                children: [
                  _buildDateDivider('Today'),
                  ..._messages.map((msg) => _buildMessageBubble(msg)),
                ],
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE7E8EA), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back),
            iconSize: 22.sp,
            color: const Color(0xFF374151),
          ),
          SizedBox(width: 4.w),

          
          Stack(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                 padding: EdgeInsets.all(1.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/spider_man.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 11.w,
                  height: 11.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 10.w),

          Text(
            'City Hospital',
            style: AppFonts.custom(
              size: 18.sp,
              weight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }

  

  Widget _buildDateDivider(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xFFE7E8EA), width: 0.5),
          ),
          child: Text(
            label,
            style: AppFonts.custom(
              size: 12.sp,
              weight: FontWeight.w500,
              color: const Color(0xFF6B7280),
            ),
          ),
        ),
      ),
    );
  }

 

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment:
            message.isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment:
                message.isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              

              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 260.w),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                     gradient: message.isSent ? AppColors.buttonColor : null,
  color: message.isSent ? null : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      bottomLeft: message.isSent
                          ? Radius.circular(16.r)
                          : Radius.circular(4.r),
                      bottomRight: message.isSent
                          ? Radius.circular(4.r)
                          : Radius.circular(16.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    message.text,
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: message.isSent
                          ? Colors.white
                          : const Color(0xFF374151),
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          
          Row(
            mainAxisAlignment:
                message.isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: AppFonts.custom(
                  size: 11.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              if (message.isSent) ...[
                SizedBox(width: 4.w),
                ShaderMask(
                   shaderCallback: (Rect bounds) {
    return AppColors.buttonColor.createShader(bounds);
  },
                  child: SvgPicture.asset(
                    'assets/images/double_tick.svg',
                    width: 16.w,
                    height: 16.w,
                    
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }




 

  Widget _buildInputBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(color: Color(0xFFE7E8EA), width: 0.5),
      ),
    ),
    child: Row(
      children: [

        // Attachment icon with container
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE7E8EA),
                width: 0.5,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/attachment.svg',
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF3E4955),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 10.w),

       
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 14.w, right: 8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: const Color(0xFF374151),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color: const Color(0xFF5E6670),
                      ),
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),

                // Mic inside the field
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: SvgPicture.asset(
                      'assets/images/mic.svg',
                      width: 24.w,
                      height: 24.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF3E4955),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),

        SizedBox(width: 10.w),

        // Send button
        GestureDetector(
          onTap: _sendMessage,
          child: Container(
            width: 44.w,
            height: 44.w,
            decoration: const BoxDecoration(
              gradient: AppColors.buttonColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/send2.svg',
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),

      ],
    ),
  );
}
}