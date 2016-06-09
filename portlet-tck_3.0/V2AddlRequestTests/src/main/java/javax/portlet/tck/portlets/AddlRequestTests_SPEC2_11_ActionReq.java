/*
 * Licensed to the Apache Software Foundation (ASF) under one or more contributor license
 * agreements. See the NOTICE file distributed with this work for additional information regarding
 * copyright ownership. The ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the License. You may obtain a
 * copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package javax.portlet.tck.portlets;

import java.io.*;
import java.util.*;
import java.util.logging.*;

import org.apache.commons.lang3.StringUtils;

import javax.portlet.*;
import javax.portlet.tck.beans.*;
import javax.portlet.tck.constants.*;
import static javax.portlet.tck.beans.JSR286SpecTestCaseDetails.*;
import static javax.portlet.tck.constants.Constants.*;
import static javax.portlet.PortletSession.*;

/**
 * This portlet implements several test cases for the JSR 362 TCK. The test case names are defined
 * in the /src/main/resources/xml-resources/additionalTCs.xml file. The build process will integrate
 * the test case names defined in the additionalTCs.xml file into the complete list of test case
 * names for execution by the driver.
 *
 * This is the main portlet for the test cases. If the test cases call for events, this portlet will
 * initiate the events, but not process them. The processing is done in the companion portlet
 * AddlRequestTests_SPEC2_11_ActionReq_event
 * @author ahmed
 */
public class AddlRequestTests_SPEC2_11_ActionReq implements Portlet {
  private static final String LOG_CLASS = AddlRequestTests_SPEC2_11_ActionReq.class.getName();
  private final Logger LOGGER = Logger.getLogger(LOG_CLASS);

  @Override
  public void init(PortletConfig config) throws PortletException {}

  @Override
  public void destroy() {}

  @Override
  public void processAction(ActionRequest portletReq, ActionResponse portletResp)
      throws PortletException, IOException {
    LOGGER.entering(LOG_CLASS, "main portlet processAction entry");

    portletResp.setRenderParameters(portletReq.getParameterMap());
    long tid = Thread.currentThread().getId();
    portletReq.setAttribute(THREADID_ATTR, tid);

    StringWriter writer = new StringWriter();

    JSR286SpecTestCaseDetails tcd = new JSR286SpecTestCaseDetails();

    // Create result objects for the tests

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType1 */
    /* Details: "The getResponseContentType method returns a String */
    /* representing the default content type the portlet container */
    /* assumes for the output" */
    TestResult tr0 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE1);
    if (portletReq.getResponseContentType() != null
        && !portletReq.getResponseContentType().isEmpty())
      tr0.setTcSuccess(true);
    tr0.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType2 */
    /* Details: "The getResponseContentTypes method returns an */
    /* Enumeration of String elements representing the acceptable content */
    /* types for the output in order of preference" */
    TestResult tr1 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE2);
    Enumeration<String> contentTypesTr1 = portletReq.getResponseContentTypes();
    if (contentTypesTr1 != null) {
       List<String> list = Collections.list(contentTypesTr1);
       if (list.isEmpty()) {
          tr1.appendTcDetail("Enumeration was empty.");
       } else {
          if (list.get(0).isEmpty()) {
             tr1.appendTcDetail("First content type string is empty.");
          } else {
             tr1.setTcSuccess(true);
          }
       }
    } else {
       tr1.appendTcDetail("Enumeration was null.");
    }
    tr1.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType3 */
    /* Details: "The first element of the Enumeration returned by the */
    /* getResponseContentTypes method must equal the value returned by */
    /* the getResponseContentType method" */
    TestResult tr2 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE3);
    Enumeration<String> contentTypesTr2 = portletReq.getResponseContentTypes();
    if (contentTypesTr2 != null) {
       List<String> list = Collections.list(contentTypesTr2);
       if (list.isEmpty()) {
          tr2.appendTcDetail("Enumeration was empty.");
       } else {
          if (!list.get(0).equals(portletReq.getResponseContentType())) {
             tr2.appendTcDetail("First content type string does not equal PortletRequest#getResponseContentType().");
          } else {
             tr2.setTcSuccess(true);
          }
       }
    } else {
       tr2.appendTcDetail("Enumeration was null.");
    }
    tr2.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType4 */
    /* Details: "If a portlet defines support for all content types using */
    /* a wildcard and the portlet container supports all content types, */
    /* the getResponseContentType may return the wildcard" */
    TestResult tr3 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE4);
    if (portletReq.getResponseContentType().equals("*/*")) {
      tr3.setTcSuccess(true);
    } else {
      tr3.appendTcDetail("Content type is " + portletReq.getResponseContentType());
    }

    tr3.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType5 */
    /* Details: "If a portlet defines support for all content types using */
    /* a wildcard and the portlet container supports all content types, */
    /* the getResponseContentType may return the preferred content type" */
    TestResult tr4 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE5);
    if (portletReq.getResponseContentType().equals("*/*")) {
      tr4.setTcSuccess(true);
    } else {
      tr4.appendTcDetail("Content type is " + portletReq.getResponseContentType());
    }
    tr4.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_windowId4 */
    /* Details: "The string returned by getWindowID method must be the */
    /* same ID used for scoping portlet-scope session attributes" */
    TestResult tr5 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_WINDOWID4);
    String tr5SessionAttribute = (String) portletReq.getPortletSession()
        .getAttribute("javax.portlet.p." + portletReq.getWindowID() + "?tr5", APPLICATION_SCOPE);
    if (tr5SessionAttribute != null && tr5SessionAttribute.equals(portletReq.getWindowID())) {
      tr5.setTcSuccess(true);
    } else {
      tr5.appendTcDetail(
          "Couldn't find javax.portlet.p." + portletReq.getWindowID() + ".tr5 attribute");
    }
    tr5.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType6 */
    /* Details: "Within the processAction method, the content type must */
    /* include only the MIME type, not the character set" */
    TestResult tr6 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE6);
    if (!StringUtils.containsIgnoreCase(portletReq.getResponseContentType(),
        portletReq.getCharacterEncoding()))
      tr6.setTcSuccess(true);
    tr6.writeTo(writer);

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType7 */
    /* Details: "Within the processAction method, the */
    /* getResponseContentTypes method must return only the content types */
    /* supported by the current portlet mode" */
    TestResult tr7 = tcd.getTestResultFailed(V2ADDLREQUESTTESTS_SPEC2_11_ACTIONREQ_CONTENTTYPE7);
    Enumeration<String> contentTypesTr7 = portletReq.getResponseContentTypes();
    if (contentTypesTr7.nextElement().equals("*/*") && !contentTypesTr7.hasMoreElements())
      tr7.setTcSuccess(true);
    tr7.writeTo(writer);

    portletReq.getPortletSession().setAttribute(
        Constants.RESULT_ATTR_PREFIX + "AddlRequestTests_SPEC2_11_ActionReq", writer.toString(),
        APPLICATION_SCOPE);
  }

  @Override
  public void render(RenderRequest portletReq, RenderResponse portletResp)
      throws PortletException, IOException {
    LOGGER.entering(LOG_CLASS, "main portlet render entry");

    long tid = Thread.currentThread().getId();
    portletReq.setAttribute(THREADID_ATTR, tid);

    PrintWriter writer = portletResp.getWriter();

    PortletSession ps = portletReq.getPortletSession();
    String msg =
        (String) ps.getAttribute(RESULT_ATTR_PREFIX + "AddlRequestTests_SPEC2_11_ActionReq",
            APPLICATION_SCOPE);
    if (msg != null) {
      writer.write("<p>" + msg + "</p><br/>\n");
      ps.removeAttribute(RESULT_ATTR_PREFIX + "AddlRequestTests_SPEC2_11_ActionReq",
          APPLICATION_SCOPE);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType1 */
    /* Details: "The getResponseContentType method returns a String */
    /* representing the default content type the portlet container */
    /* assumes for the output" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType1", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType2 */
    /* Details: "The getResponseContentTypes method returns an */
    /* Enumeration of String elements representing the acceptable content */
    /* types for the output in order of preference" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType2", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType3 */
    /* Details: "The first element of the Enumeration returned by the */
    /* getResponseContentTypes method must equal the value returned by */
    /* the getResponseContentType method" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType3", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType4 */
    /* Details: "If a portlet defines support for all content types using */
    /* a wildcard and the portlet container supports all content types, */
    /* the getResponseContentType may return the wildcard" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType4", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType5 */
    /* Details: "If a portlet defines support for all content types using */
    /* a wildcard and the portlet container supports all content types, */
    /* the getResponseContentType may return the preferred content type" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType5", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_windowId4 */
    /* Details: "The string returned by getWindowID method must be the */
    /* same ID used for scoping portlet-scope session attributes" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      portletReq.getPortletSession().setAttribute("tr5", portletReq.getWindowID(), PORTLET_SCOPE);
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_windowId4", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType6 */
    /* Details: "Within the processAction method, the content type must */
    /* include only the MIME type, not the character set" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType6", aurl);
      tb.writeTo(writer);
    }

    /* TestCase: V2AddlRequestTests_SPEC2_11_ActionReq_contentType7 */
    /* Details: "Within the processAction method, the */
    /* getResponseContentTypes method must return only the content types */
    /* supported by the current portlet mode" */
    {
      PortletURL aurl = portletResp.createActionURL();
      aurl.setParameters(portletReq.getPrivateParameterMap());
      TestButton tb = new TestButton("V2AddlRequestTests_SPEC2_11_ActionReq_contentType7", aurl);
      tb.writeTo(writer);
    }

  }

}
