package net.utility;

public class Paging {  
  /**
   * ¼ıÀÚ ÇüÅÂÀÇ ÆäÀÌÂ¡, 1 ÆäÀÌÁöºÎÅÍ ½ÃÀÛ
   * ÇöÀç ÆäÀÌÁö: 11 / 22   [ÀÌÀü] 11 12 13 14 15 16 17 18 19 20 [´ÙÀ½]
   * 
   * @param totalRecord ÀüÃ¼ ·¹ÄÚµå¼ö
   * @param nowPage     ÇöÀç ÆäÀÌÁö
   * @param recordPerPage ÆäÀÌÁö´ç ·¹ÄÚµå ¼ö 
   * @return
   */

  public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String filenm){
    int pagePerBlock = 10; // ºí·°´ç ÆäÀÌÁö ¼ö
    int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ÀüÃ¼ ÆäÀÌÁö 
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ÀüÃ¼ ±×·ì
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ÇöÀç ±×·ì
    int startPage = ((nowGrp - 1) * recordPerPage) + 1; // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï ½ÃÀÛ 
    int endPage = (nowGrp * (int)Math.ceil((double)totalRecord/recordPerPage));	// Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï Á¾·á  
    //System.out.println(startPage);
    //System.out.println(endPage);
€
    StringBuffer str = new StringBuffer();
    
    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    //str.append("ÇöÀç ÆäÀÌÁö: " + nowPage + " / " + totalPage + "&nbsp;&nbsp;");

    int _nowPage = (nowGrp-1) * pagePerBlock; // 10°³ ÀÌÀü ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp >= 2){
      str.append("[<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>ÀÌÀü</A>]");
    }

    for(int i=startPage; i<=endPage; i++){
      if (i > totalPage){
        break;
      }
 
      if (nowPage == i){ // ÇöÀç ÆäÀÌÁöÀÌ¸é °­Á¶ È¿°ú
        str.append("<span style='font-size: 1.2em; font-weight: bold;'>"+i+"</span>&nbsp;");  
      }else{
        str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A>&nbsp;");
      }
      
    }
    
    _nowPage = (nowGrp * pagePerBlock)+1; // 10°³ ´ÙÀ½ ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp < totalGrp){
      str.append("[<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>´ÙÀ½</A>]");
    }
    str.append("</DIV>");
    
    return str.toString();
  }
  
  /**
   * SPANÅÂ±×¸¦ ÀÌ¿ëÇÑ ¹Ú½º ¸ğµ¨ÀÇ Áö¿ø, 1 ÆäÀÌÁöºÎÅÍ ½ÃÀÛ
   * ÇöÀç ÆäÀÌÁö: 11 / 22   [ÀÌÀü] 11 12 13 14 15 16 17 18 19 20 [´ÙÀ½]
   * 
   * @param totalRecord ÀüÃ¼ ·¹ÄÚµå¼ö
   * @param nowPage     ÇöÀç ÆäÀÌÁö
   * @param recordPerPage ÆäÀÌÁö´ç ·¹ÄÚµå ¼ö 
   * @return
   */
  public static String paging2(int totalRecord, int nowPage, int recordPerPage, String col, String word, String filenm){
    int pagePerBlock = 10; // ºí·°´ç ÆäÀÌÁö ¼ö
    int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ÀüÃ¼ ÆäÀÌÁö 
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ÀüÃ¼ ±×·ì
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ÇöÀç ±×·ì
    int startPage = ((nowGrp - 1) * recordPerPage) + 1; // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï ½ÃÀÛ 
    int endPage = (nowGrp * (int)Math.ceil((double)totalRecord/recordPerPage));             // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï Á¾·á  
    
    StringBuffer str = new StringBuffer();
    
    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("    margin:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    background-color: #CCCCCC;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("    margin:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    //str.append("ÇöÀç ÆäÀÌÁö: " + nowPage + " / " + totalPage + "&nbsp;&nbsp;");

    int _nowPage = (nowGrp-1) * pagePerBlock; // 10°³ ÀÌÀü ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp >= 2){
      str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'><span class='span_box_1'>ÀÌÀü</span></A>&nbsp;");
    }

    for(int i=startPage; i<=endPage; i++){
      if (i > totalPage){
        break;
      }
 
      if (nowPage == i){
        str.append("<span class='span_box_2'>&nbsp;"+i+"&nbsp;</span>&nbsp;");
      }else{
        str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+i+"'><span class='span_box_1'>&nbsp;"+i+"&nbsp;</span></A>&nbsp;");  
      }
    }
    
    _nowPage = (nowGrp * pagePerBlock)+1; // 10°³ ´ÙÀ½ ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp < totalGrp){
      str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'><span class='span_box_1'>´ÙÀ½</span></A>&nbsp;");
    }
    str.append("</DIV>");
    
    return str.toString();
  }
  
  /**
   * SPANÅÂ±×¸¦ ÀÌ¿ëÇÑ ¹Ú½º ¸ğµ¨ÀÇ Áö¿ø, 1 ÆäÀÌÁöºÎÅÍ ½ÃÀÛ
   * ÇöÀç ÆäÀÌÁö: 11 / 22   [ÀÌÀü] 11 12 13 14 15 16 17 18 19 20 [´ÙÀ½]
   * 
   * @param totalRecord ÀüÃ¼ ·¹ÄÚµå¼ö
   * @param nowPage     ÇöÀç ÆäÀÌÁö
   * @param recordPerPage ÆäÀÌÁö´ç ·¹ÄÚµå ¼ö 
   * @return
   */
  public static String paging3(int totalRecord, int nowPage, int recordPerPage, String col, String word, String filenm){
    int pagePerBlock = 10; // ºí·°´ç ÆäÀÌÁö ¼ö
    int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ÀüÃ¼ ÆäÀÌÁö 
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ÀüÃ¼ ±×·ì
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ÇöÀç ±×·ì
    int startPage = ((nowGrp - 1) * recordPerPage) + 1; // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï ½ÃÀÛ 
    int endPage = (nowGrp * (int)Math.ceil((double)totalRecord/recordPerPage));             // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï Á¾·á  
    
    StringBuffer str = new StringBuffer();
    
    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("    margin:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("    margin:0px 0px 0px 0px; /*À§, ¿À¸¥ÂÊ, ¾Æ·¡, ¿ŞÂÊ*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    //str.append("ÇöÀç ÆäÀÌÁö: " + nowPage + " / " + totalPage + "&nbsp;&nbsp;");

    int _nowPage = (nowGrp-1) * pagePerBlock; // 10°³ ÀÌÀü ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp >= 2){
      str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'><span class='span_box_1'>ÀÌÀü</span></A>&nbsp;");
    }

    for(int i=startPage; i<=endPage; i++){
      if (i > totalPage){
        break;
      }
 
      if (nowPage == i){
        str.append("<span class='span_box_2'>&nbsp;"+i+"&nbsp;</span>&nbsp;");
      }else{
        str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+i+"'><span class='span_box_1'>&nbsp;"+i+"&nbsp;</span></A>&nbsp;");  
      }
    }
    
    _nowPage = (nowGrp * pagePerBlock)+1; // 10°³ ´ÙÀ½ ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp < totalGrp){
      str.append("<A href='./"+filenm+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'><span class='span_box_1'>´ÙÀ½</span></A>&nbsp;");
    }
    str.append("</DIV>");
    
    return str.toString();
  }

public static  String paging4(int totalRecord, int nowPage, int recordPerPage, String filenm){
    int pagePerBlock = 10; // ºí·°´ç ÆäÀÌÁö ¼ö
    int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ÀüÃ¼ ÆäÀÌÁö 
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ÀüÃ¼ ±×·ì
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ÇöÀç ±×·ì
    int startPage = ((nowGrp - 1) * recordPerPage) + 1; // Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï ½ÃÀÛ 
    int endPage = (nowGrp * (int)Math.ceil((double)totalRecord/recordPerPage));	// Æ¯Á¤ ±×·ìÀÇ ÆäÀÌÁö ¸ñ·Ï Á¾·á  
    System.out.println(startPage);
    System.out.println(endPage);
    StringBuffer str = new StringBuffer();
    
    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    //str.append("ÇöÀç ÆäÀÌÁö: " + nowPage + " / " + totalPage + "&nbsp;&nbsp;");

    int _nowPage = (nowGrp-1) * pagePerBlock; // 10°³ ÀÌÀü ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp >= 2){
      str.append("[<A href='./"+filenm+"?nowPage="+_nowPage+"'>ÀÌÀü</A>]");
    }

    for(int i=startPage; i<=endPage; i++){
      if (i > totalPage){
        break;
      }
 
      if (nowPage == i){ // ÇöÀç ÆäÀÌÁöÀÌ¸é °­Á¶ È¿°ú
        str.append("<span style='font-size: 1.2em; font-weight: bold;'>"+i+"</span>&nbsp;");  
      }else{
        str.append("<A href='./"+filenm+"?nowPage="+i+"'>"+i+"</A>&nbsp;");
      }
      
    }
    
    _nowPage = (nowGrp * pagePerBlock)+1; // 10°³ ´ÙÀ½ ÆäÀÌÁö·Î ÀÌµ¿
    if (nowGrp < totalGrp){
      str.append("[<A href='./"+filenm+"?nowPage="+_nowPage+"'>´ÙÀ½</A>]");
    }
    str.append("</DIV>");
    
    return str.toString();
  }

}