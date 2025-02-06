
import 'dart:developer';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'app_assets.dart';
import 'app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'text_utility.dart';



boxShadow(){
  return BoxShadow(
    color: AppColors.containerBorderColor.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 15,
    offset: Offset(0, 3), // changes position of shadow
  );
}
boxShadowTextField(){
  return BoxShadow(
    color: AppColors.containerBorderColor.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 15,
    offset: Offset(4, 2), // changes position of shadow
  );
}

backButton({void Function()? onTap,bool isBackButton = true,Color? color}){
  return isBackButton?GestureDetector(
    onTap: onTap,
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color??Color(0xffD0E1EA)),
      child: Image.asset(AppAssets.backArrow).marginAll(4),
    ),
  ):Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor),
    child: Image.asset(AppAssets.backArrow,color: AppColors.whiteColor,).marginAll(4),
  );
}

shareButton({void Function()? onTap,Color? color}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color??Color(0xffD0E1EA)),
      child: Image.asset(AppAssets.shareIcon).marginAll(6),
    ),
  );
}

logoutButton({void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor),
      child: Image.asset(AppAssets.logoutSidebar,color: AppColors.primaryColor,).marginAll(4),
    ),
  );
}

uploadButton({void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      decoration: BoxDecoration(
          color: AppColors.containerBorderColor.withOpacity(0.4),
          border: Border.all(color: AppColors.containerBorderColor),
          borderRadius: BorderRadius.circular(100)),
      child: Center(child: Image.asset(AppAssets.uploadIcon,width: 20,height: 20,)),
    ),
  );
}

switchButton({bool value =false,void Function()? onTap}){
  return Stack(
    alignment: Alignment.centerLeft,
    children: [ GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.0, // Width of the switch button
        height: 20.0, // Height of the switch button
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          // border: Border.all(color: value?AppColors.primaryColor: AppColors.redColor,),
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          color:AppColors.whiteColor, // Active and inactive colors
        ),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft, // Position the switch
        child: Container(
          width: 18.0, // Width of the switch thumb
          height: 18.0, // Height of the switch thumb
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Circular thumb
            color: value?AppColors.primaryColor: AppColors.redColor1, // Thumb color
          ),
        ).marginAll(2),
      ),
    ) ],
  );
}

// toast
showToast(String msg){ return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );}

showToastError(String msg){ return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );}

showToastBack(BuildContext context,String msg){
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.launcherIcon,height: 20,width: 20,),
          SizedBox(width: 12.0),
          addText400(msg, color: Colors.white),
        ],
      ),
    );

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 20.0,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: toast,
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });

}


CircularProgressIndicator CPI(){ return CircularProgressIndicator(color: AppColors.primaryColor);}

// CustomImageNetwork(String imageUrl, {double? height, width, BoxFit? fit}){
//   return Image.network(
//     imageUrl, fit: fit??BoxFit.fill,
//     height: height??kMinInteractiveDimension,
//     width: width??kMinInteractiveDimension,
//     loadingBuilder: (
//
//         BuildContext context, Widget child,
//         ImageChunkEvent? loadingProgress ) {
//       if (loadingProgress == null) return child;
//       return Center(
//         child: CircularProgressIndicator(
//           color: AppColors.secondaryColor.withOpacity(0.20),
//           value: loadingProgress.expectedTotalBytes != null
//               ? loadingProgress.cumulativeBytesLoaded /
//               loadingProgress.expectedTotalBytes!
//               : null,
//
//         ),);},
//
//
//   );
// }

Widget CustomImageNetwork(
    String imageUrl, {
      double? height,
      double? width,
      BoxFit fit = BoxFit.fill,
    }) {
  return Image.network(
    imageUrl,
    fit: fit,
    height: height ?? kMinInteractiveDimension,
    width: width ?? kMinInteractiveDimension,
    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child; // If loading is complete, show the image

      return Center(
        child: CircularProgressIndicator(
          color: Colors.blue.withOpacity(0.20), // Replace with your AppColors.secondaryColor
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              : null,
        ),
      );
    },
    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
      return Center(
        child: Icon(Icons.error, color: Colors.red), // Display an error icon if the image fails to load
      );
    },
  );
}


Widget CCI({double?height, double?width, Color? borderColor,String? imgPath }){
  return Container(
    height: height??32,
    width: width??32,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor??AppColors.primaryColor,width: 2)),
    child: Image.asset(imgPath??AppAssets.userIcon,fit: BoxFit.fill,),
  );
}

leviconPrint({required String message}){
  return log('$message');
}





// Buttons
buttonEditDelete({bool isEdit = false, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: isEdit == true ? AppColors.primaryColor : AppColors
                .primaryLightColor, shape: BoxShape.circle),
        child: SvgPicture.asset(isEdit == true ? AppAssets.editSlotSvg : AppAssets
            .deleteSlotSvg).marginAll(7)),
  );
}

CachedImageCircle({String? imageUrl, double? height, double? width}){
  return Container(
    height: height??150,
    width: width??150,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
        shape: BoxShape.circle
    ),
    child: FastCachedImage(
      url: imageUrl!,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(seconds: 1),
      errorBuilder: (context, exception, stacktrace) {
        return addText400(stacktrace.toString());
      },
      loadingBuilder: (context, progress) {
        return Container(
          color: AppColors.primaryLightColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (progress.isDownloading && progress.totalBytes != null)
                addText400('${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',color: AppColors.redColor1),

              SizedBox(
                  width: width??150,
                  height: height??150,
                  child:
                  CircularProgressIndicator(color: AppColors.primaryColor, value: progress.progressPercentage.value)),
            ],
          ),
        );
      },
    ),
  );
}









