package com.bigbigmall.xiamen.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
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
	 * 九九乘法表-xml 2019-3-24 当前练习
	 *
	 * @return
	 */
	@RequestMapping("/multiplicationXml")
	@ResponseBody
	public JSONArray getMultiplicationTableXML() {
		JSONArray array = new JSONArray();

		//获取2-5的值
		List<JSONArray> list = getArray(2, 5);
		for (int i = 0; i < list.size(); i++) {
			array.put(list.get(i));
		}

		//获取6-9的值
		List<JSONArray> list2 = getArray(6, 9);
		for (int i = 0; i < list2.size(); i++) {
			array.put(list2.get(i));
		}

		return array;
	}

	/**
	 * 获取九九乘法表数据
	 *
	 * @param s 开始值
	 * @param v 结束值
	 * @return 返回集合
	 */
	public List<JSONArray> getArray(int s, int v) {
		List<JSONArray> list = new ArrayList<>();

		for (int i = 1; i <= 9; i++) {
			JSONArray array = new JSONArray();
			for (int j = s; j <= v; j++) {
				JSONObject object = new JSONObject();
				object.put("mt1", " " + j + " ");
				object.put("mt2", i + " = ");
				object.put("mt3", (i * j));
				array.put(object);
			}
			list.add(array);
		}
		return list;
	}

	/**
	 * 九九乘法表-XML 2019-3-24 当前练习
	 *
	 * @return
	 */
	@RequestMapping("/tableXML")
	@ResponseBody
	public ModelAndView getMultiplicationXml(HttpServletResponse response) throws Exception {
		//获取文档对象
		DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
		DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
		Document doc = newDocumentBuilder.newDocument();

		//创建根节点
		Element documentElement = doc.createElement("document");
		doc.appendChild(documentElement);

		//获取数据
		JSONArray mtArray = getMultiplicationTableXML();

		//循环添加
		for (int i = 0; i < mtArray.length(); i++) {
			Element mtsElement = doc.createElement("mts");
			documentElement.appendChild(mtsElement);
			JSONArray array = mtArray.getJSONArray(i);

			for (int j = 0; j < array.length(); j++) {
				Element msElement = doc.createElement("ms");
				mtsElement.appendChild(msElement);
				//添加乘数
				Element mtElement = doc.createElement("mt1");
				//添加被乘数
				Element mt2Element = doc.createElement("mt2");
				//添加积
				Element mt3Element = doc.createElement("mt3");
				msElement.appendChild(mtElement);
				msElement.appendChild(mt2Element);
				msElement.appendChild(mt3Element);
				JSONObject object = array.getJSONObject(j);
				//判断是否是素数
				String mt3 = object.get("mt3").toString();
				if ("2".equals(mt3) || "3".equals(mt3) || "5".equals(mt3) || "7".equals(mt3)) {
					mt3Element.setAttribute("name", "");
				}
				mtElement.appendChild(doc.createTextNode(object.get("mt1").toString()));
				mt2Element.appendChild(doc.createTextNode(object.get("mt2").toString()));
				mt3Element.appendChild(doc.createTextNode(mt3));

			}
		}

		Source source = new DOMSource(doc);
		// 将XML源文件添加到模型中，以便XsltView能够检测
		ModelAndView model = new ModelAndView("multiplication");
		model.addObject("xmlSource", source);

		return model;
		//TransformerFactory.newInstance().newTransformer().transform(new DOMSource(doc), new StreamResult(new File("C:\\netBensJmvn/a.xml")));
	}

	/**
	 * 求两数区间的素数-前端页面调用 2019-3-20
	 *
	 * @param minimum
	 * @param maximum
	 * @return
	 */
	@RequestMapping("/primeNumbers")
	@ResponseBody
	public String getPrimeNumbers(int minimum, int maximum) {
		if (minimum > 0 && maximum > 0 && maximum > minimum) {

			String max = "";
			for (int i = minimum; i <= maximum; i++) {
				if (i == 1) {
					continue;
				}
				if (i == 2) {
					max += i + "  ";
					continue;
				}

				for (int j = 2; j < i; j++) {
					if (i % j == 0) {
						break;
					}
					if ((j + 1) == i) {
						max += i + "  ";
					}
				}
			}
			System.out.println("max:" + max);
			return max;
		}
		return "Incorrect parameters";
	}

	/**
	 * 九九乘法表-前端页面调用 2019-3-21
	 *
	 * @return
	 */
	@RequestMapping("/multiplication")
	@ResponseBody
	public String getMultiplicationTable() {

		JSONArray array = new JSONArray();
		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				JSONObject object = new JSONObject();
				if ((i == 2 || i == 3 || i == 5 || i == 7) && j == 1) {
					object.put(i + "", (i + "&#215;" + j + "=" + "<font color='red'>" + (i * j) + "</font>"));
				} else {
					object.put(i + "", (i + "&#215;" + j + "=" + (i * j)));
				}
				array.put(object);
			}
		}
		String toString = array.toString();
		return toString;
	}

	/**
	 * 九九乘法表4 2019-3-21
	 *
	 * @return
	 */
	@RequestMapping("/multiplication4")
	@ResponseBody
	public String getMultiplication4() {
		JSONArray array = new JSONArray();
		for (int i = 1; i < 10; i++) {
			JSONArray array1 = new JSONArray();
			array.put(array1);
			for (int j = 1; j < 10; j++) {
				JSONObject object = new JSONObject();
				object.put("name", i + "*" + j + "=" + (i * j));
				array1.put(object);
			}
		}

		String string = array.toString();
		return string;
	}
}
