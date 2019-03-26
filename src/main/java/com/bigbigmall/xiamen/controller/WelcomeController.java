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

        /*---------------------------------stream↓以下测试-------------------------------------------------*/
        @RequestMapping("/stream")
        @ResponseBody
        public JSONArray step() {
                JSONArray array = new JSONArray();
                IntStream intStream = IntStream.range(2, 10);// 获取乘积
                IntStream intStream2 = IntStream.range(2, 10);// 获取乘數
                IntStream intStream3 = IntStream.range(2, 10);// 获取被乘數
                IntStream flatMap = intStream.flatMap(this::multiplication);//获取乘积结果
                IntStream flatMap2 = intStream2.flatMap(this::multiplication2);// 获取乘數结果
                IntStream flatMap3 = intStream3.flatMap(this::multiplication3);// 获取被乘數结果
                int[] toArray = flatMap.toArray();
                int[] toArray2 = flatMap2.toArray();
                int[] toArray3 = flatMap3.toArray();
                for (int i = 0; i < toArray.length; i++) {
                        JSONObject object = new JSONObject();
                        object.put("mt1", toArray3[i]);
                        object.put("mt2", toArray2[i]);
                        object.put("mt3", toArray[i]);
                        array.put(object);
                }
                //String string = array.toString();
                return array;
        }

        //获取乘积
        private IntStream multiplication(int input) {
                return IntStream.range(1, 10).map(k -> input * k);
        }

        //获取乘數
        private IntStream multiplication2(int input) {
                return IntStream.range(1, 10).map(k -> input);
        }

        //获取被乘數
        private IntStream multiplication3(int input) {
                return IntStream.range(1, 10).map(k -> k);
        }

        /**
         * 九九乘法表-XML 测试
         *
         * @return
         */
        @RequestMapping("/streamXML")
        @ResponseBody
        public ModelAndView getStreamXml(HttpServletResponse response) throws Exception {
                //获取文档对象
                DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
                DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
                Document doc = newDocumentBuilder.newDocument();

                //创建根节点
                Element documentElement = doc.createElement("document");
                doc.appendChild(documentElement);

                //获取数据
                JSONArray mtArray = step();

                //添加2-5
                getMts(doc, mtArray, 0, 9, documentElement);

                //添加6-9
                getMts(doc, mtArray, 36, 45, documentElement);

                Source source = new DOMSource(doc);
                // 将XML源文件添加到模型中，以便XsltView能够检测
                ModelAndView model = new ModelAndView("multiplication");
                model.addObject("xmlSource", source);

                return model;
                // TransformerFactory.newInstance().newTransformer().transform(new DOMSource(doc), new StreamResult(response.getOutputStream()));
        }

        //添加mts
        public Element getMts(Document doc, JSONArray mtArray, int i, int q, Element documentElement) {
                for (int j = i; j < q; j++) {
                        Element mtsElement = doc.createElement("mts");
                        documentElement.appendChild(mtsElement);
                        JSONObject object = mtArray.getJSONObject(j);
                        Element element = getMs(doc, object);
                        mtsElement.appendChild(element);
                        JSONObject object2 = mtArray.getJSONObject(j + 9);
                        Element element2 = getMs(doc, object2);
                        mtsElement.appendChild(element2);
                        JSONObject object3 = mtArray.getJSONObject(j + 18);
                        Element element3 = getMs(doc, object3);
                        mtsElement.appendChild(element3);
                        JSONObject object4 = mtArray.getJSONObject(j + 27);
                        Element element4 = getMs(doc, object4);
                        mtsElement.appendChild(element4);
                }

                return documentElement;
        }

        //添加ms
        public Element getMs(Document doc, JSONObject object) {
                Element msElement = doc.createElement("ms");

                Element mt1Element = doc.createElement("mt1");
                Element mt2Element = doc.createElement("mt2");
                Element mt3Element = doc.createElement("mt3");
                mt1Element.appendChild(doc.createTextNode(object.get("mt2").toString() + " "));
                mt2Element.appendChild(doc.createTextNode(object.get("mt1").toString() + " = "));
                mt3Element.appendChild(doc.createTextNode(object.get("mt3").toString()));
                msElement.appendChild(mt1Element);
                msElement.appendChild(mt2Element);
                msElement.appendChild(mt3Element);

                return msElement;
        }

        /*---------------------------------stream↑以上测试-------------------------------------------------*/
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
                                mtElement.appendChild(doc.createTextNode(object.get("mt1").toString()));
                                mt2Element.appendChild(doc.createTextNode(object.get("mt2").toString()));
                                mt3Element.appendChild(doc.createTextNode(object.get("mt3").toString()));

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
