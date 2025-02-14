import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ButtonLikeTextField extends StatefulWidget {
  final Icon prefixIcon;
  final String text;
  final VoidCallback? onTap;
  final Icon? suffixIcon;
  final Icon? prefixIcon2;
  final String? text2;
  final VoidCallback? onTap2;
  final Icon? prefixIcon3;
  final String? text3;
  final VoidCallback? onTap3;

  const ButtonLikeTextField ({Key? key,
        required this.prefixIcon,
        required this.text,
        this.suffixIcon,
        this.prefixIcon2,
        this.text2,
        this.prefixIcon3,
        this.text3,
        this.onTap,
        this.onTap2,
        this.onTap3
      }) : super(key: key);

  @override
  State<ButtonLikeTextField> createState() => _ButtonLikeTextFieldState();
}

class _ButtonLikeTextFieldState extends State<ButtonLikeTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff2D2D2D).withOpacity(0.4) ,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///First Row
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: widget.onTap,
                        child: widget.prefixIcon),
                    const SizedBox(width: 8,),
                    Text( widget.text, style: GoogleFonts.inter(
                      textStyle:  const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                          color: Color(0xff2D2D2D)
                        ),
                      ),
                      overflow:TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                if(widget.suffixIcon!= null)...[
                  widget.suffixIcon!
                ],
              ],
            ),

            ///SecondRow If Condition
            if ( widget.prefixIcon2 != null || widget.text2!= null )...[
              const Divider(
                color: Color(0xffEAEAEA),
                thickness: 2,
              ),

               const SizedBox(height: 2,),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 GestureDetector(
                     onTap: widget.onTap2,
                     child: widget.prefixIcon2!),
                 const SizedBox(width: 8,),
          Text(widget.text2!, style: GoogleFonts.inter(
             textStyle:  const TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.w400,
                 color: Color(0xff2D2D2D),
             ),
           ),
          overflow:TextOverflow.ellipsis,
          maxLines: 1,
           ),
               ],
                           ),
              const SizedBox(height: 2,),
            ],

            ///ThirdRow If Condition
            if ( widget.prefixIcon3 != null || widget.text3!= null )...[
              const Divider(
                color: Color(0xffEAEAEA),
                thickness: 2,
              ),

              const SizedBox(height: 2,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: widget.onTap3,
                    child: widget.prefixIcon3!),
                const SizedBox(width: 8,),
                Text(widget.text3!, style: GoogleFonts.inter(
                  textStyle:  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2D2D2D),
                  ),
                ),
                  overflow:TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2,),
              ],
            ),
                ],
          ],
        ),
      ),
    );
  }
}
