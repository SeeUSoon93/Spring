/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2023-10-06 08:50:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1612850415545L));
    _jspx_dependants.put("jar:file:/C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SoonService2/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("  \n");
      out.write("    <!DOCTYPE html>\n");
      out.write("    <html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("      <title>Soon Service</title>\n");
      out.write("      <meta charset=\"utf-8\">\n");
      out.write("      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\n");
      out.write("      <style type=\"text/css\">\n");
      out.write("        @charset \"UTF-8\";\n");
      out.write("\n");
      out.write("        @font-face {\n");
      out.write("          font-family: 'GeekbleMalang2WOFF2';\n");
      out.write("          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/GeekbleMalang2WOFF2.woff2') format('woff2');\n");
      out.write("          font-weight: normal;\n");
      out.write("          font-style: normal;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* 제목 폰트 - g마켓산스미디엄 */\n");
      out.write("        @font-face {\n");
      out.write("          font-family: 'GmarketSansMedium';\n");
      out.write("          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');\n");
      out.write("          font-weight: normal;\n");
      out.write("          font-style: normal;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* 내용 폰트 - 프리텐다드 */\n");
      out.write("        @font-face {\n");
      out.write("          font-family: 'Pretendard-Regular';\n");
      out.write("          src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');\n");
      out.write("          font-weight: 400;\n");
      out.write("          font-style: normal;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* 웹진에서 사용하기 */\n");
      out.write("        @font-face {\n");
      out.write("          font-family: 'Chosunilbo_myungjo';\n");
      out.write("          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');\n");
      out.write("          font-weight: normal;\n");
      out.write("          font-style: normal;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("          font-family: 'Pretendard-Regular';\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #headCon {\n");
      out.write("          padding-top: 10px;\n");
      out.write("          padding-bottom: 10px;\n");
      out.write("          padding-left: 20%;\n");
      out.write("          padding-right: 20%;\n");
      out.write("          font-family: 'GeekbleMalang2WOFF2';\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #login,\n");
      out.write("        #wform {\n");
      out.write("          padding-top: 100px;\n");
      out.write("          padding-left: 20%;\n");
      out.write("          padding-right: 20%;\n");
      out.write("          paddig-bottom: 20%;\n");
      out.write("          justify-content: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #kakao-login-btn {\n");
      out.write("          display: flex;\n");
      out.write("          align-items: center;\n");
      out.write("          justify-content: center;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #headingOne,\n");
      out.write("        #headingTwo,\n");
      out.write("        #headingThree,\n");
      out.write("        .card-title {\n");
      out.write("          font-family: 'GmarketSansMedium';\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #collapseOne,\n");
      out.write("        #collapseTwo,\n");
      out.write("        #collapseThree {\n");
      out.write("          font-family: 'Pretendard-Regular';\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #view {\n");
      out.write("          padding-top: 90px;\n");
      out.write("          padding-left: 20%;\n");
      out.write("          padding-right: 20%;\n");
      out.write("          paddig-bottom: 20%;\n");
      out.write("          justify-content: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #CList {\n");
      out.write("          padding-top: 5px;\n");
      out.write("          justify-content: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #repleArea {\n");
      out.write("          display: flex;\n");
      out.write("          justify-content: space-around;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .reple {\n");
      out.write("          width: 85%;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #reIns {\n");
      out.write("          width: 10%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        #writer {\n");
      out.write("          padding-top: 10px;\n");
      out.write("          padding-left: 20%;\n");
      out.write("          padding-right: 20%;\n");
      out.write("          justify-content: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .good {\n");
      out.write("          background-color: #ffffff;\n");
      out.write("          color: rgb(0, 0, 0);\n");
      out.write("          height: 30px;\n");
      out.write("          border-color: #ffffff00;\n");
      out.write("        }\n");
      out.write("      </style>\n");
      out.write("\n");
      out.write("      <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js\"></script>\n");
      out.write("      <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n");
      out.write("        integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n");
      out.write("      <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"\n");
      out.write("        integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("      <script src=\"https://code.jquery.com/jquery-3.7.0.min.js\"></script>\n");
      out.write("\n");
      out.write("      <script src=\"https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js\"\n");
      out.write("        integrity=\"sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("      <script src=\"https://developers.kakao.com/sdk/js/kakao.js\"></script>\n");
      out.write("\n");
      out.write("      <script type=\"text/javascript\">\n");
      out.write("        $(document).ready(() => {\n");
      out.write("          // HTML 구조가 다 로딩이 된 후에 loadList()실행\n");
      out.write("          loadList()\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        const loadList = () => {\n");
      out.write("          // BoardController에서 게시글 전체목록을 가져오는 기능\n");
      out.write("          $.ajax({\n");
      out.write("            url: \"boardSelectList.do\",\n");
      out.write("            dataType: \"json\",\n");
      out.write("            success: makeView, //callback함수\n");
      out.write("            error: () => { alert(\"error\"); }\n");
      out.write("          });\n");
      out.write("        }\n");
      out.write("        // 성공 시 실행할 makeView 함수 -> jsp에 데이터를 뿌려주는 함수\n");
      out.write("\t\tconst makeView = (data) => {\n");
      out.write("\t\t    console.log(data);\n");
      out.write("\t\t\n");
      out.write("\t\t    // 게시글을 표시할 부모 요소\n");
      out.write("\t\t    const $view = $('#view');\n");
      out.write("\t\t\n");
      out.write("\t\t    // 비동기 작업을 순차적으로 처리하기 위한 함수\n");
      out.write("\t\t    const processPost=(index)=> {\n");
      out.write("\t\t        if (index < data.length) {\n");
      out.write("\t\t            const obj = data[index];\n");
      out.write("\t\t\n");
      out.write("\t\t            $.ajax({\n");
      out.write("\t\t                url: \"repleSelectList.do\",\n");
      out.write("\t\t                data: { \"idx\": obj.idx },\n");
      out.write("\t\t                dataType: \"json\",\n");
      out.write("\t\t                success: (data2) => {\n");
      out.write("\t\t                \tconsole.log('다시 불러옴');\n");
      out.write("\t\t                    // 게시글 요소를 동적으로 생성\n");
      out.write("\t\t                    const $post = $(\"<div class='CList'></div>\");\n");
      out.write("\t\t                    const $card = $(\"<div class='card'></div>\");\n");
      out.write("\t\t                    const $cardBody = $(\"<div class='card-body'></div>\");\n");
      out.write("\t\t\n");
      out.write("\t\t                    // 게시글 내용 설정\n");
      out.write("\t\t                    $cardBody.append(\"<h5 class='card-title'>\" + obj.btitle + \"</h5>\");\n");
      out.write("\t\t                    $cardBody.append(\"<span id='c\" + obj.idx + \"' style='display:none;'></span>\");\n");
      out.write("\t\t                    $cardBody.append(\"<h6 class='card-subtitle mb-2 text-muted'>\" + obj.nick + \"</h6>\");\n");
      out.write("\t\t                    $cardBody.append(\"<p class='card-text'>\" + obj.bcontent + \"</p><hr>\");\n");
      out.write("\t\t                    $cardBody.append(\"<p class='card-text' style='font-size: smaller;'>\" + obj.bdate + \"</p>\");\n");
      out.write("\t\t                    $cardBody.append(\"<p class='card-text'><a href='javascript:goGood(\" + obj.idx + \")'><button type='button' class='good'>💓</button></a><span id='goodCount\" + obj.idx + \"'>\" + obj.bgood + \"</span></p>\");\n");
      out.write("\t\t\n");
      out.write("\t\t                    // 댓글 출력\n");
      out.write("\t\t                    $.each(data2, (index, obj2)=>{\n");
      out.write("\t\t                   \t \t$cardBody.append(\"<div id='newreple\"+ obj.idx + \"'></div><p class='card-text' style='font-size: smaller;'>\" + obj2.rcontent + \"</p>\");\n");
      out.write("\t\t                    });\n");
      out.write("\t\t                    // 댓글 입력 폼\n");
      out.write("\t\t                    $cardBody.append(\"<div id='repleArea'><input type='text' id='reple\" + obj.idx + \"' name='reple' class='form-control'><button id='reIns' type='button' class='btn btn-primary btn-sm' onclick='repleInsert(\" + obj.idx + \")'>등록</button></div>\");\n");
      out.write("\t\t\n");
      out.write("\t\t                    // 게시글 요소를 화면에 추가\n");
      out.write("\t\t                    $card.append($cardBody);\n");
      out.write("\t\t                    $post.append($card);\n");
      out.write("\t\t                    $view.append($post);\n");
      out.write("\t\t\n");
      out.write("\t\t                    // 다음 게시글 처리\n");
      out.write("\t\t                    processPost(index + 1);\n");
      out.write("\t\t                },\n");
      out.write("\t\t                error: () => { alert(\"error\"); }\n");
      out.write("\t\t            });\n");
      out.write("\t\t        } else {\n");
      out.write("\t\t            // 모든 게시글을 처리한 후에 필요한 작업 수행\n");
      out.write("\t\t            goList();\n");
      out.write("\t\t        }\n");
      out.write("\t\t    }\n");
      out.write("\t\t\n");
      out.write("\t\t    // 첫 번째 게시글부터 시작\n");
      out.write("\t\t    processPost(0);\n");
      out.write("\t\t};\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        const goForm = () => {\n");
      out.write("          $(\"#writer\").css(\"display\", \"none\")\n");
      out.write("          $(\"#login\").css(\"display\", \"none\")\n");
      out.write("          $(\"#view\").css(\"display\", \"none\")\n");
      out.write("          $(\"#wform\").css(\"display\", \"block\")\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        const goList = () => {\n");
      out.write("          $(\"#writer\").css(\"display\", \"block\")\n");
      out.write("          $(\"#login\").css(\"display\", \"none\")\n");
      out.write("          $(\"#view\").css(\"display\", \"block\")\n");
      out.write("          $(\"#wform\").css(\"display\", \"none\")\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        const boardInsert = () => {\n");
      out.write("          $.ajax({\n");
      out.write("            url: \"boardInsert.do\",\n");
      out.write("            data: $(\"#form\").serialize(),\n");
      out.write("            type: 'POST',\n");
      out.write("            success: loadList, // 새로고침\n");
      out.write("            error: () => { alert(\"error\"); }\n");
      out.write("          });\n");
      out.write("        }\n");
      out.write("        //\n");
      out.write("        const goGood = (idx) => {\n");
      out.write("        \tconsole.log(idx);\n");
      out.write("          $.ajax({\n");
      out.write("            url: \"boardGood.do\", /* 어디로 보낼지 */\n");
      out.write("            data: { \"idx\": idx }, /* 어떤 데이터를 보낼지 */\n");
      out.write("            dataType:\"json\",\n");
      out.write("            type: 'POST',\n");
      out.write("            success:(data)=>{            \t\n");
      out.write("            \t$(\"#goodCount\"+idx).html(data.bgood);             \t           \t\n");
      out.write("            },\n");
      out.write("            error: () => { alert(\"error\"); }\n");
      out.write("          });\n");
      out.write("          \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        const repleInsert=(idx)=>{\n");
      out.write("\t\t\tconsole.log(idx);\n");
      out.write("\t\t\tvar rContent = $(\"#reple\"+idx).val();\n");
      out.write("\t\t\tconsole.log(rContent);\n");
      out.write("\t\t\t$.ajax({\n");
      out.write("\t\t\t\turl : \"repleInsert.do\",\n");
      out.write("\t\t\t\ttype:'POST',\n");
      out.write("\t\t\t\tdata: { \"idx\": idx,\n");
      out.write("\t\t\t\t\t\t\"rContent\" : rContent },\n");
      out.write("\t\t\t\tdataType:\"json\",\n");
      out.write("\t\t\t\tsuccess : (data)=>{\n");
      out.write("\t\t\t\t\tconsole.log(data)\n");
      out.write("            \t\tvar con = \"\";\t\t\t\t\t\n");
      out.write("            \t\tcon += \"<p class='card-text' style='font-size: smaller;'>\" + data[data.length-1].rcontent + \"</p>\";\n");
      out.write("            \t\t\n");
      out.write("            \tconsole.log(con)\n");
      out.write("\t            \t$(\"#newreple\"+idx).prepend(con);            \t\n");
      out.write("\t            },\n");
      out.write("\t\t\t\terror : ()=>{alert(\"error\");}\t\t\t\t\n");
      out.write("\t\t\t});\n");
      out.write("\t\t}\n");
      out.write("\n");
      out.write("\n");
      out.write("      </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("      <!-- 헤더 -->\n");
      out.write("      <nav class=\"navbar navbar-expand-lg bg-light\">\n");
      out.write("        <div class=\"container-fluid\" id=\"headCon\">\n");
      out.write("          <a class=\"navbar-brand\" href=\"/controller\">순이</a>\n");
      out.write("          <ul class=\"nav nav-pills\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link active\" aria-current=\"page\" href=\"/controller\">타임라인</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"#\">마이페이지</a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </nav>\n");
      out.write("      <!-- 글쓰기 폼 -->\n");
      out.write("      <div id='writer'><input type='text' id='boardInsert' name='reple' class='form-control' placeholder=\"무엇이든 적어보세요!\"\n");
      out.write("          onclick='goForm()'></div>\n");
      out.write("\n");
      out.write("      <!-- 첫 화면 로그인 -->\n");
      out.write("      <div class=\"accordion\" id=\"login\" style=\"display:none\">\n");
      out.write("        <div class=\"accordion-item\">\n");
      out.write("          <h2 class=\"accordion-header\" id=\"headingOne\">\n");
      out.write("            <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseOne\"\n");
      out.write("              aria-expanded=\"true\" aria-controls=\"collapseOne\">\n");
      out.write("              카카오로 시작하기\n");
      out.write("            </button>\n");
      out.write("          </h2>\n");
      out.write("          <div id=\"collapseOne\" class=\"accordion-collapse collapse show\" aria-labelledby=\"headingOne\"\n");
      out.write("            data-bs-parent=\"#accordionExample\">\n");
      out.write("            <div class=\"accordion-body\">\n");
      out.write("              <ul>\n");
      out.write("                <li id=\"kakao-login-btn\" onclick=\"kakaoLogin();\">\n");
      out.write("                  <a href=\"javascript:void(0)\">\n");
      out.write("                    <img src=\"https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg\" alt=\"카카오 로그인 버튼\">\n");
      out.write("                  </a>\n");
      out.write("                </li>\n");
      out.write("                <!-- 로그인 시작 -->\n");
      out.write("                <script>\n");
      out.write("                  //카카오로그인\n");
      out.write("                  const kakaoLogin = () => {\n");
      out.write("                    Kakao.Auth.login({\n");
      out.write("                      scope: 'profile_nickname, account_email',\n");
      out.write("                      success: () => {\n");
      out.write("                        Kakao.API.request({\n");
      out.write("                          url: '/v2/user/me',\n");
      out.write("                          success: (response) => {\n");
      out.write("                            console.log(response)\n");
      out.write("                            // Ajax를 이용해 post방식으로 값 넘기기                   \n");
      out.write("                            $.ajax({\n");
      out.write("                              type: 'POST',\n");
      out.write("                              url: 'EmailCheck',\n");
      out.write("                              data: { email: response.kakao_account.email },\n");
      out.write("                              datatype: \"text\",\n");
      out.write("                              success: (data) => {\n");
      out.write("                                if (data == 'false') {\n");
      out.write("                                  $.ajax({\n");
      out.write("                                    // 로그인 시키기\n");
      out.write("                                    type: 'POST',\n");
      out.write("                                    url: 'LoginService',\n");
      out.write("                                    data: {\n");
      out.write("                                      nickName: response.properties.nickname,\n");
      out.write("                                    },\n");
      out.write("                                    success: (result) => {\n");
      out.write("                                      console.log(result);\n");
      out.write("                                      location.replace();\n");
      out.write("                                    },\n");
      out.write("                                    error: () => {\n");
      out.write("                                      location.replace();\n");
      out.write("                                    }\n");
      out.write("                                  })\n");
      out.write("                                } else {\n");
      out.write("                                  $.ajax({\n");
      out.write("                                    // 중복이 아니니까 회원가입 시키기\n");
      out.write("                                    type: 'POST',\n");
      out.write("                                    url: 'JoinService',\n");
      out.write("                                    data: {\n");
      out.write("                                      nickName: response.properties.nickname,\n");
      out.write("                                      email: response.kakao_account.email,\n");
      out.write("                                    },\n");
      out.write("                                    success: (result) => {\n");
      out.write("                                      console.log(result);\n");
      out.write("                                      location.replace();\n");
      out.write("                                    },\n");
      out.write("                                    error: (error) => {\n");
      out.write("                                      console.log(error);\n");
      out.write("                                      location.replace();\n");
      out.write("                                    }\n");
      out.write("                                  })\n");
      out.write("                                }\n");
      out.write("                              }\n");
      out.write("                            });\n");
      out.write("                          },\n");
      out.write("                          fail: (error) => {\n");
      out.write("                            console.log(error)\n");
      out.write("                          },\n");
      out.write("                        })\n");
      out.write("                      },\n");
      out.write("                      fail: (error) => {\n");
      out.write("                        console.log(error)\n");
      out.write("                      },\n");
      out.write("                    })\n");
      out.write("                  }\n");
      out.write("                </script>\n");
      out.write("                <!-- \n");
      out.write("              ✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️\n");
      out.write("             -->\n");
      out.write("\n");
      out.write("              </ul>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"accordion-item\">\n");
      out.write("          <h2 class=\"accordion-header\" id=\"headingTwo\">\n");
      out.write("            <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\"\n");
      out.write("              data-bs-target=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\n");
      out.write("              메일로 로그인\n");
      out.write("            </button>\n");
      out.write("          </h2>\n");
      out.write("          <div id=\"collapseTwo\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingTwo\"\n");
      out.write("            data-bs-parent=\"#accordionExample\">\n");
      out.write("            <div class=\"accordion-body\">\n");
      out.write("              로그인 넣기\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"accordion-item\">\n");
      out.write("          <h2 class=\"accordion-header\" id=\"headingThree\">\n");
      out.write("            <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\"\n");
      out.write("              data-bs-target=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("              메일로 회원가입\n");
      out.write("            </button>\n");
      out.write("          </h2>\n");
      out.write("          <div id=\"collapseThree\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingThree\"\n");
      out.write("            data-bs-parent=\"#accordionExample\">\n");
      out.write("            <div class=\"accordion-body\">\n");
      out.write("              회원가입 넣기\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- 로그인 하면 타임라인, 마이페이지 중 선택 (기본은 스레드) -->\n");
      out.write("\n");
      out.write("      <!-- 타임라인 목록 -->\n");
      out.write("      <div id=\"view\">\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- 글쓰기 -->\n");
      out.write("      <div class=\"card-body\" id=\"wform\" style=\"display: none;\">\n");
      out.write("        <form id=\"form\" name=\"form\" th:object=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${board}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("          <div class='card'>\n");
      out.write("            <div class='card-body'>\n");
      out.write("              <input type=\"text\" id=\"bTitle\" name=\"bTitle\" class=\"form-control card-title\">\n");
      out.write("              <input type=\"text\" id=\"nick\" name=\"nick\" class=\"form-control card-text\">\n");
      out.write("\n");
      out.write("              <textarea rows=\"7\" cols=\"\" id=\"bContent\" name=\"bContent\" class=\"form-control card-text\"></textarea>\n");
      out.write("\n");
      out.write("              <div class=card-text style=\"justify-content: center;\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-success btn-sm\" onclick='boardInsert()'>등록</button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary btn-sm\" onclick='goList()'>취소</button>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("    </html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
