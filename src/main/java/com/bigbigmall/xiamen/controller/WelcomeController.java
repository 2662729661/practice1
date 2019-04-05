package com.bigbigmall.xiamen.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * @author lian
 */
@Controller
@RequestMapping("/")
public class WelcomeController {

	/**
	 * 2019-4-4 个人页面
	 * https://redan-api.herokuapp.com/personnels/search/findOneById?id=3
	 */
	@RequestMapping("/personal2")
	@ResponseBody
	public ModelAndView getPersonal2(HttpServletResponse response) throws Exception {
		//获取文档对象
		DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
		DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
		Document doc = newDocumentBuilder.newDocument();

		//创建根节点
		Element documentElement = doc.createElement("document");
		doc.appendChild(documentElement);

		//创建连接
		HttpGet httpGet = new HttpGet("https://redan-api.herokuapp.com/personnels/search/findOneById?id=3");

		//获取请求体
		CloseableHttpResponse execute = HttpClients.createDefault().execute(httpGet);
		HttpEntity entity = execute.getEntity();

		if (entity != null) {
			String string = EntityUtils.toString(entity, "UTF-8");

			JSONObject object = new JSONObject(string);
			Iterator<String> keys = object.keys();
			for (int i = 0; i < object.length(); i++) {
				String next = keys.next();
				Element nextElement = doc.createElement(next);
				documentElement.appendChild(nextElement);
				if ("coverImgUrl".equals(next) || "profileImgUrl".equals(next)) {
					nextElement.setAttribute("text", object.get(next).toString());
				}
				if ("nickname".equals(next) || "universallyUniqueIdentifier".equals(next) || "id".equals(next)) {
					nextElement.appendChild(doc.createTextNode(object.get(next).toString()));
				}
			}
		}
		Source source = new DOMSource(doc);
		// 将XML源文件添加到模型中，以便XsltView能够检测
		ModelAndView model = new ModelAndView("personal2");
		model.addObject("xmlSource", source);

		return model;
		//TransformerFactory.newInstance().newTransformer().transform(new DOMSource(doc), new StreamResult(response.getOutputStream()));
	}

	/*------------------------------------------------------------------------------------*/
	/**
	 * 2019-4-3 xsl t 显示页面
	 */
	@RequestMapping("/personalPage")
	@ResponseBody
	public ModelAndView getPersonalPage(HttpServletResponse response) throws Exception {
		//获取文档对象
		DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
		DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
		Document doc = newDocumentBuilder.newDocument();

		//创建根节点
		Element documentElement = doc.createElement("document");
		doc.appendChild(documentElement);

		//获取数据
		JSONArray personalPageArray = getPersonalPageArray();

		for (int i = 0; i < personalPageArray.length(); i++) {
			//对象
			JSONObject object = personalPageArray.getJSONObject(i);
			String next = object.keys().next();

			//标签
			Element nextElement = doc.createElement(next);
			documentElement.appendChild(nextElement);
			if (!"commodity".equals(next)) {
				//文本
				nextElement.appendChild(doc.createTextNode(object.get(next).toString()));
			}
			if ("commodity".equals(next)) {
				//array
				JSONArray commodityArray = object.getJSONArray(next);
				getObj(commodityArray, doc, nextElement);
			}

		}
		Source source = new DOMSource(doc);
		// 将XML源文件添加到模型中，以便XsltView能够检测
		ModelAndView model = new ModelAndView("personal");
		model.addObject("xmlSource", source);

		return model;
		//TransformerFactory.newInstance().newTransformer().transform(new DOMSource(doc), new StreamResult(response.getOutputStream()));
	}

	public void getObj(JSONArray commodityArray, Document doc, Element nextElement) {

		for (int i = 0; i < commodityArray.length(); i++) {
			Element columnElement = doc.createElement("column");
			nextElement.appendChild(columnElement);
			JSONObject object = commodityArray.getJSONObject(i);
			Element hrefElement = doc.createElement("href");
			hrefElement.appendChild(doc.createTextNode(object.get("href").toString()));
			columnElement.appendChild(hrefElement);
			Element srcElement = doc.createElement("src");
			srcElement.appendChild(doc.createTextNode(object.get("src").toString()));
			columnElement.appendChild(srcElement);
		}
	}

	//生成数据
	@RequestMapping("/personalPageArray")
	@ResponseBody
	public JSONArray getPersonalPageArray() {
		JSONArray array = new JSONArray();
		array.put(new JSONObject().put("tracker", "320"));
		array.put(new JSONObject().put("postscript", "320"));
		array.put(new JSONObject().put("tracking", "320"));
		array.put(new JSONObject().put("name", "Redan"));
		array.put(new JSONObject().put("situation", "明星賣家"));
		array.put(new JSONObject().put("introduce",
			"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n"
			+ "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n"
			+ "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n"
			+ "consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n"
			+ "cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n"
			+ "proident, sunt in culpa qui officia deserunt mollit anim id est laborum."));

		array.put(new JSONObject().put("commodity", getArr()));
		array.put(new JSONObject().put("commodity", getArr()));
		return array;
	}

	public JSONArray getArr() {
		JSONArray array = new JSONArray();
		for (int i = 0; i < 3; i++) {
			JSONObject object = new JSONObject();
			object.put("href", "#").put("src", "https://via.placeholder.com/180");
			array.put(object);
		}
		return array;
	}

	/*------------------------------------------------------------------------------------*/
	/**
	 * 测试10
	 *
	 * @param nid
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/personalPage2")
	@ResponseBody
	public ModelAndView getPersonalPage2() throws Exception {
		//创建文档对象
		DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
		DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
		Document doc = newDocumentBuilder.newDocument();

		//创建根标签
		Element documentElement = doc.createElement("document");
		doc.appendChild(documentElement);

		JSONArray personalPageArray = getPersonalPageArray2();

		for (int i = 0; i < personalPageArray.length(); i++) {
			Element arElement = null;
			if (i == 0) {
				arElement = doc.createElement("ar");
			} else {
				arElement = doc.createElement("ax");
			}
			documentElement.appendChild(arElement);
			JSONArray array = personalPageArray.getJSONArray(i);

			for (int j = 0; j < array.length(); j++) {
				Element divsElement = doc.createElement("divs");
				arElement.appendChild(divsElement);
				JSONObject object = array.getJSONObject(j);

				Element div1Element = doc.createElement("div1");
				div1Element.appendChild(doc.createTextNode(object.get("div1").toString()));
				divsElement.appendChild(div1Element);
				Element div2Element = doc.createElement("div2");
				div2Element.appendChild(doc.createTextNode(object.get("div2").toString()));
				divsElement.appendChild(div2Element);
				Element class1Element = doc.createElement("class1");
				class1Element.appendChild(doc.createTextNode(object.get("class1").toString()));
				divsElement.appendChild(class1Element);
				Element class2Element = doc.createElement("class2");
				class2Element.appendChild(doc.createTextNode(object.get("class2").toString()));
				divsElement.appendChild(class2Element);
			}
		}

		Source source = new DOMSource(doc);
		// 将XML源文件添加到模型中，以便XsltView能够检测
		ModelAndView model = new ModelAndView("personalPage");
		model.addObject("xmlSource", source);

		return model;
		//TransformerFactory.newInstance().newTransformer().transform(new DOMSource(doc), new StreamResult(response.getOutputStream()));
	}

	public JSONArray getPersonalPageArray2() {
		JSONArray array = new JSONArray();

		JSONArray arrayAr = new JSONArray();
		array.put(arrayAr);
		arrayAr.put(getObject("ID", "509230671", "col-md-2", "col-md-6"));
		arrayAr.put(getObject("姓名", "莊瑞生", "col-md-2", "col-md-6"));
		arrayAr.put(getObject("Email", "redan@gmail.com", "col-md-2", "col-md-6"));
		arrayAr.put(getObject("手機", "12345678", "col-md-2", "col-md-6"));
		arrayAr.put(getObject("專業", "明星賣家", "col-md-2", "col-md-6"));

		JSONArray arrayAx = new JSONArray();
		array.put(arrayAx);
		arrayAx.put(getObject("Experience", "Expert", "col-md-6", "col-md-6"));
		arrayAx.put(getObject("Hourly Rate", "10$/hr", "col-md-6", "col-md-6"));
		arrayAx.put(getObject("Total Projects", "230", "col-md-6", "col-md-6"));
		arrayAx.put(getObject("English Level", "Expert", "col-md-6", "col-md-6"));
		arrayAx.put(getObject("Availability", "6 months", "col-md-6", "col-md-6"));

		return array;
	}

	public JSONObject getObject(String div1, String div2, String class1, String class2) {
		JSONObject object = new JSONObject();
		object.put("div1", div1);
		object.put("class1", class1);
		object.put("div2", div2);
		object.put("class2", class2);
		return object;
	}
}
