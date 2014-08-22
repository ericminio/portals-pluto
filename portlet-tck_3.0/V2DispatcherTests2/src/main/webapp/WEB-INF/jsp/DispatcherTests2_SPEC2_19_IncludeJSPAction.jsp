<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0"  prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*,java.util.logging.*" %>
<%@ page import="static java.util.logging.Logger.*" %>
<%@ page import="javax.portlet.*,javax.portlet.filter.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.portlet.tck.beans.*,javax.portlet.tck.constants.*" %>
<%@ page import="static javax.portlet.tck.constants.Constants.*" %>
<%@ page import="static javax.portlet.tck.beans.JSR286DispatcherTestCaseDetails.*" %>
<%

      PortletRequest portletReq = (PortletRequest) request.getAttribute("javax.portlet.request");
      PortletResponse portletResp = (PortletResponse) request.getAttribute("javax.portlet.response");
      PortletConfig portletConfig = (PortletConfig) request.getAttribute("javax.portlet.config");
      long svtTid = Thread.currentThread().getId();
      long reqTid = (Long) portletReq.getAttribute(THREADID_ATTR);

      StringWriter writer = new StringWriter();

      JSR286DispatcherTestCaseDetails tcd = new JSR286DispatcherTestCaseDetails();

      // Create result objects for the tests

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_dispatch1     */
      /* Details: "If the path provided to getRequestDispatcher method        */
      /* contains query strings, parameters specified in the query strings    */
      /* must be passed to the target servlet during an include"              */
      TestResult tr0 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_DISPATCH1);
      try {
         String qparm1 = portletReq.getParameter("qparm1");
         String qparm2 = portletReq.getParameter("qparm2");
         boolean ok = ((qparm1 != null) && (qparm2 != null));
         if (ok) ok = (qparm1.equals("qvalue1") && qparm2.equals("qvalue2"));
         if (!ok) tr0.appendTcDetail("qparm1=" + qparm1 + ", qparm2=" + qparm2);
         tr0.setTcSuccess(ok);
      } catch(Exception e) {tr0.appendTcDetail(e.toString());}
      tr0.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_dispatch2     */
      /* Details: "Parameters specified in the query strings must be          */
      /* aggregated with the portlet render parameters"                       */
      TestResult tr1 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_DISPATCH2);
      try {
         String[] qparm2 = portletReq.getParameterValues("qparm2");
         boolean ok = ((qparm2 != null) && (qparm2.length > 1));
         String str = "qparm2 " + ((qparm2==null)?("is null"):("length="+qparm2.length));
         if (!ok) tr1.appendTcDetail(str);
         tr1.setTcSuccess(ok);
      } catch(Exception e) {tr1.appendTcDetail(e.toString());}
      tr1.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_dispatch3     */
      /* Details: "If query string parameters have the same names as render   */
      /* parameter names, the query string parameters appear in the           */
      /* parameter values array before the render parameter values"           */
      TestResult tr2 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_DISPATCH3);
      try {
         String qparm1 = portletReq.getParameter("qparm1");
         String qparm2 = portletReq.getParameter("qparm2");
         boolean ok = ((qparm1 != null) && (qparm2 != null));
         if (ok) ok = (qparm1.equals("qvalue1") && qparm2.equals("qvalue2"));
         if (!ok) tr2.appendTcDetail("qparm1=" + qparm1 + ", qparm2=" + qparm2);
         tr2.setTcSuccess(ok);
      } catch(Exception e) {tr2.appendTcDetail(e.toString());}
      tr2.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_invoke1       */
      /* Details: "The PortletRequestDispatcher include method can target a   */
      /* servlet "                                                            */
      TestResult tr3 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_INVOKE1);
      try {
         // If this gets executed, include worked.
         tr3.setTcSuccess(true);
      } catch(Exception e) {tr3.appendTcDetail(e.toString());}
      tr3.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_invoke2       */
      /* Details: "Parameters to the include method for a target servlet      */
      /* can be the request and response classes from the portlet lifecyle    */
      /* method initiating the include"                                       */
      TestResult tr4 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_INVOKE2);
      try {
         // If this gets executed, include worked.
         tr4.setTcSuccess(true);
      } catch(Exception e) {tr4.appendTcDetail(e.toString());}
      tr4.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_invoke4       */
      /* Details: "The portlet container must invoke the target servlet in    */
      /* the same thread as the PortletRequestDispatcher include              */
      /* invocation"                                                          */
      TestResult tr5 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_INVOKE4);
      try {
         tr5.setTcSuccess(reqTid == svtTid);
      } catch(Exception e) {tr5.appendTcDetail(e.toString());}
      tr5.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_invoke7       */
      /* Details: "The path elements of the request object exposed to the     */
      /* target servlet must reflect the path used to obtain the              */
      /* RequestDispatcher"                                                   */
      TestResult tr6 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_INVOKE7);
      try {
         String ctxPath= request.getContextPath();
         CompareUtils.stringsEqual(ctxPath, "/DispatcherTests2_SPEC2_19_IncludeJSPAction", tr6);
      } catch(Exception e) {tr6.appendTcDetail(e.toString());}
      tr6.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes1   */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.include.request_uri will be set, and equals the        */
      /* value from HTTPServletRequest.getRequestURI for the first servlet    */
      /* in the include chain"                                                */
      TestResult tr7 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES1);
      try {
         String name = "javax.servlet.include.request_uri";
         String attrVal = (String) portletReq.getAttribute(name);
         String currVal =  request.getRequestURI();
         CompareUtils.stringsEqual(attrVal, currVal, tr7);
      } catch(Exception e) {tr7.appendTcDetail(e.toString());}
      tr7.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes1a  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.include.request_uri will be set, and equals the        */
      /* value from HTTPServletRequest.getRequestURI for the first servlet    */
      /* in the include chain"                                                */
      TestResult tr8 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES1A);
      try {
         String name = "javax.servlet.include.request_uri";
         String attrVal = (String) request.getAttribute(name);
         String currVal =  request.getRequestURI();
         CompareUtils.stringsEqual(attrVal, currVal, tr8);
      } catch(Exception e) {tr8.appendTcDetail(e.toString());}
      tr8.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes1b  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.forward.request_uri will not be set"                   */
      TestResult tr9 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES1B);
      try {
         String name = "javax.servlet.forward.request_uri";
         String attrVal = (String) portletReq.getAttribute(name);
         if (attrVal != null) tr9.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr9.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr9.appendTcDetail(e.toString());}
      tr9.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes1c  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.forward.request_uri will not be set"                   */
      TestResult tr10 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES1C);
      try {
         String name = "javax.servlet.forward.request_uri";
         String attrVal = (String) request.getAttribute(name);
         if (attrVal != null) tr10.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr10.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr10.appendTcDetail(e.toString());}
      tr10.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes2   */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.include.context_path will be set, and equals the       */
      /* value from HTTPServletRequest.getContestPath for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr11 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES2);
      try {
         String name = "javax.servlet.include.context_path";
         String attrVal = (String) portletReq.getAttribute(name);
         String currVal =  request.getContextPath();
         CompareUtils.stringsEqual(attrVal, currVal, tr11);
      } catch(Exception e) {tr11.appendTcDetail(e.toString());}
      tr11.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes2a  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.include.context_path will be set, and equals the       */
      /* value from HTTPServletRequest.getContestPath for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr12 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES2A);
      try {
         String name = "javax.servlet.include.context_path";
         String attrVal = (String) request.getAttribute(name);
         String currVal =  request.getContextPath();
         CompareUtils.stringsEqual(attrVal, currVal, tr12);
      } catch(Exception e) {tr12.appendTcDetail(e.toString());}
      tr12.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes2b  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.forward.context_path will not be set"                  */
      TestResult tr13 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES2B);
      try {
         String name = "javax.servlet.forward.context_path";
         String attrVal = (String) portletReq.getAttribute(name);
         if (attrVal != null) tr13.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr13.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr13.appendTcDetail(e.toString());}
      tr13.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes2c  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.forward.context_path will not be set"                  */
      TestResult tr14 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES2C);
      try {
         String name = "javax.servlet.forward.context_path";
         String attrVal = (String) request.getAttribute(name);
         if (attrVal != null) tr14.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr14.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr14.appendTcDetail(e.toString());}
      tr14.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes3   */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.include.servlet_path will be set, and equals the       */
      /* value from HTTPServletRequest.getServletPath for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr15 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES3);
      try {
         String name = "javax.servlet.include.servlet_path";
         String attrVal = (String) portletReq.getAttribute(name);
         String currVal =  request.getServletPath();
         CompareUtils.stringsEqual(attrVal, currVal, tr15);
      } catch(Exception e) {tr15.appendTcDetail(e.toString());}
      tr15.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes3a  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.include.servlet_path will be set, and equals the       */
      /* value from HTTPServletRequest.getServletPath for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr16 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES3A);
      try {
         String name = "javax.servlet.include.servlet_path";
         String attrVal = (String) request.getAttribute(name);
         String currVal =  request.getServletPath();
         CompareUtils.stringsEqual(attrVal, currVal, tr16);
      } catch(Exception e) {tr16.appendTcDetail(e.toString());}
      tr16.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes3b  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.forward.servlet_path will not be set"                  */
      TestResult tr17 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES3B);
      try {
         String name = "javax.servlet.forward.servlet_path";
         String attrVal = (String) portletReq.getAttribute(name);
         if (attrVal != null) tr17.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr17.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr17.appendTcDetail(e.toString());}
      tr17.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes3c  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.forward.servlet_path will not be set"                  */
      TestResult tr18 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES3C);
      try {
         String name = "javax.servlet.forward.servlet_path";
         String attrVal = (String) request.getAttribute(name);
         if (attrVal != null) tr18.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr18.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr18.appendTcDetail(e.toString());}
      tr18.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes4   */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.include.path_info will be set, and equals the value    */
      /* from HTTPServletRequest.getPathInfo for the first servlet in the     */
      /* include chain"                                                       */
      TestResult tr19 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES4);
      try {
         String name = "javax.servlet.include.path_info";
         String attrVal = (String) portletReq.getAttribute(name);
         String currVal =  request.getPathInfo();
         CompareUtils.stringsEqual(attrVal, currVal, tr19);
      } catch(Exception e) {tr19.appendTcDetail(e.toString());}
      tr19.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes4a  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.include.path_info will be set, and equals the value    */
      /* from HTTPServletRequest.getPathInfo for the first servlet in the     */
      /* include chain"                                                       */
      TestResult tr20 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES4A);
      try {
         String name = "javax.servlet.include.path_info";
         String attrVal = (String) request.getAttribute(name);
         String currVal =  request.getPathInfo();
         CompareUtils.stringsEqual(attrVal, currVal, tr20);
      } catch(Exception e) {tr20.appendTcDetail(e.toString());}
      tr20.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes4b  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.forward.path_info will not be set"                     */
      TestResult tr21 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES4B);
      try {
         String name = "javax.servlet.forward.path_info";
         String attrVal = (String) portletReq.getAttribute(name);
         if (attrVal != null) tr21.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr21.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr21.appendTcDetail(e.toString());}
      tr21.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes4c  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.forward.path_info will not be set"                     */
      TestResult tr22 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES4C);
      try {
         String name = "javax.servlet.forward.path_info";
         String attrVal = (String) request.getAttribute(name);
         if (attrVal != null) tr22.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr22.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr22.appendTcDetail(e.toString());}
      tr22.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes5   */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.include.query_string will be set, and equals the       */
      /* value from HTTPServletRequest.getQueryString for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr23 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES5);
      try {
         String name = "javax.servlet.include.query_string";
         String attrVal = (String) portletReq.getAttribute(name);
         String currVal =  request.getQueryString();
         CompareUtils.stringsEqual(attrVal, currVal, tr23);
      } catch(Exception e) {tr23.appendTcDetail(e.toString());}
      tr23.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes5a  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.include.query_string will be set, and equals the       */
      /* value from HTTPServletRequest.getQueryString for the first servlet   */
      /* in the include chain"                                                */
      TestResult tr24 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES5A);
      try {
         String name = "javax.servlet.include.query_string";
         String attrVal = (String) request.getAttribute(name);
         String currVal =  request.getQueryString();
         CompareUtils.stringsEqual(attrVal, currVal, tr24);
      } catch(Exception e) {tr24.appendTcDetail(e.toString());}
      tr24.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes5b  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the portlet request attribute           */
      /* javax.servlet.forward.query_string will not be set"                  */
      TestResult tr25 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES5B);
      try {
         String name = "javax.servlet.forward.query_string";
         String attrVal = (String) portletReq.getAttribute(name);
         if (attrVal != null) tr25.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr25.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr25.appendTcDetail(e.toString());}
      tr25.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes5c  */
      /* Details: "If the request dispatcher is obtained through the          */
      /* getRequestDispatcher method, the servlet request attribute           */
      /* javax.servlet.forward.query_string will not be set"                  */
      TestResult tr26 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES5C);
      try {
         String name = "javax.servlet.forward.query_string";
         String attrVal = (String) request.getAttribute(name);
         if (attrVal != null) tr26.appendTcDetail("Attribute should be null, but has the value of: " + attrVal);
         tr26.setTcSuccess(attrVal == null);
      } catch(Exception e) {tr26.appendTcDetail(e.toString());}
      tr26.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes6   */
      /* Details: "The request attribute javax.portlet.config must be set     */
      /* to the javax.portlet.PortletConfig object"                           */
      TestResult tr27 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES6);
      try {
         ClassChecker cc = new ClassChecker(portletConfig.getClass());
         boolean ok = cc.implementsInterface(PortletConfig.class);
         tr27.setTcSuccess(ok);
      } catch(Exception e) {tr27.appendTcDetail(e.toString());}
      tr27.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes7   */
      /* Details: "For includes from the processAction method, The request    */
      /* attribute javax.portlet.request must be set to the                   */
      /* javax.portlet.ActionRequest object"                                  */
      TestResult tr28 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES7);
      try {
         ClassChecker cc = new ClassChecker(portletReq.getClass());
         boolean ok = cc.implementsInterface(ActionRequest.class);
         tr28.setTcSuccess(ok);
      } catch(Exception e) {tr28.appendTcDetail(e.toString());}
      tr28.writeTo(writer);

      /* TestCase: V2DispatcherTests2_SPEC2_19_IncludeJSPAction_attributes8   */
      /* Details: "For includes from the processAction method, The request    */
      /* attribute javax.portlet.response must be set to the                  */
      /* javax.portlet.ActionResponse object"                                 */
      TestResult tr29 = tcd.getTestResultFailed(V2DISPATCHERTESTS2_SPEC2_19_INCLUDEJSPACTION_ATTRIBUTES8);
      try {
         ClassChecker cc = new ClassChecker(portletResp.getClass());
         boolean ok = cc.implementsInterface(ActionResponse.class);
         tr29.setTcSuccess(ok);
      } catch(Exception e) {tr29.appendTcDetail(e.toString());}
      tr29.writeTo(writer);

      request.getSession().setAttribute(
                   Constants.RESULT_ATTR_PREFIX + "DispatcherTests2_SPEC2_19_IncludeJSPAction",
                   writer.toString());
%>