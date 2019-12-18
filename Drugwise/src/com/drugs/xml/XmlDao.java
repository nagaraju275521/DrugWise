package com.drugs.xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import com.drugs.brand.Brand;
import com.mysql.jdbc.PreparedStatement;

public class XmlDao {

	public void exportXmlFile() throws IOException {
		String file = "C:/work/Drugwise.xml";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			Statement stmt = conn.createStatement();

			ArrayList<Brand> Brand_result = new ArrayList<Brand>();
			List<String> exist = new ArrayList<String>();
			ResultSet rsu = stmt.executeQuery("SELECT * FROM brand");
			while (rsu.next()) {
				Brand bran = new Brand();
				bran.setBrand_ID(rsu.getString("Brand_ID"));
				bran.setBrand_Name(rsu.getString("Brand_Name"));
				Brand_result.add(bran);
			}

			ResultSet rs = stmt.executeQuery("select * from drugs");
			StringWriter stringWriter = new StringWriter();
			XMLOutputFactory xMLOutputFactory = XMLOutputFactory.newInstance();
			XMLStreamWriter xMLStreamWriter = xMLOutputFactory
					.createXMLStreamWriter(stringWriter);
			xMLStreamWriter = xMLOutputFactory
					.createXMLStreamWriter(new FileWriter(file));
			xMLStreamWriter.writeStartDocument();
			xMLStreamWriter.writeStartElement("DRUGNAMEID");
			while (rs.next()) {
				Statement stm = conn.createStatement();
				ResultSet ex = stm
						.executeQuery("SELECT * FROM drug_brand WHERE Drug_ID="
								+ rs.getString("Drug_ID"));
				while (ex.next()) {
					exist.add(ex.getString("Brand_ID"));
				}

				xMLStreamWriter.writeStartElement("drugs");

				xMLStreamWriter.writeStartElement("Drug_ID");
				xMLStreamWriter.writeCharacters(rs.getString("Drug_ID"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Drug_Name");
				xMLStreamWriter.writeCharacters(rs.getString("Drug_Name"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Drug_Brand");

				for (Brand s : Brand_result) {
					if (exist.contains(s.getBrand_ID())) {
						System.out.println(s.getBrand_ID() + ":---:"
								+ s.getBrand_Name());
						xMLStreamWriter.writeCharacters(s.getBrand_Name()
								+ "\t");
					}
				}

				xMLStreamWriter.writeEndElement();
				// xMLStreamWriter.writeCharacters(rs.getString("Drug_Name"));

				xMLStreamWriter.writeStartElement("Pharmacological_Class");
				xMLStreamWriter.writeCharacters(rs
						.getString("Pharmacological_Class"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("MechanismOFAction");
				xMLStreamWriter.writeCharacters(rs
						.getString("MechanismOFAction"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Uses");
				xMLStreamWriter.writeCharacters(rs.getString("Uses"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Dosage");
				xMLStreamWriter.writeCharacters(rs.getString("Dosage"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Adverse_Effects");
				xMLStreamWriter
						.writeCharacters(rs.getString("Adverse_Effects"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Contra_Indication");
				xMLStreamWriter.writeCharacters(rs
						.getString("Contra_Indication"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Drug_Interaction");
				xMLStreamWriter.writeCharacters(rs
						.getString("Drug_Interaction"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("Precaution");
				xMLStreamWriter.writeCharacters(rs.getString("Precaution"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeStartElement("PharmaCare_Information");
				xMLStreamWriter.writeCharacters(rs
						.getString("PharmaCare_Information"));
				xMLStreamWriter.writeEndElement();

				xMLStreamWriter.writeEndElement(); // end of drugs element

				exist.removeAll(exist);
			} // end of while loop
			xMLStreamWriter.writeEndElement(); // end of DRUGNAMEID element
			xMLStreamWriter.writeEndDocument();
			xMLStreamWriter.flush();
			xMLStreamWriter.close();
			stringWriter.close();
		} catch (XMLStreamException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if ((new File(file)).exists()) {
			Process p = Runtime.getRuntime().exec(
					"rundll32 url.dll,FileProtocolHandler " + file);
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("File is not exists");
		}
	}

	public void uploadXmlFile() {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			PreparedStatement ps = (PreparedStatement) conn
					.prepareStatement("insert into drugs values(?,?,?,?,?,?,?,?,?,?,?)");
			DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			Document doc = docBuilder.parse(new File("C:/work/Drugwise.xml"));

			// normalize text representation
			doc.getDocumentElement().normalize();
			System.out.println("Root element of the doc is "
					+ doc.getDocumentElement().getNodeName());

			NodeList listOfPersons = doc.getElementsByTagName("drugs");
			int totalPersons = listOfPersons.getLength();
			int a = totalPersons;
			System.out.println("Total no of people : " + a);

			System.out.println("list no of people : " + listOfPersons);
			for (int s = 0; s < a; s++) {
				Node firstPersonNode = listOfPersons.item(s);
				if (firstPersonNode.getNodeType() == Node.ELEMENT_NODE) {

					Element firstPersonElement = (Element) firstPersonNode;

					NodeList drugList = firstPersonElement
							.getElementsByTagName("DRUGNAME");
					Element drugElement = (Element) drugList.item(0);
					NodeList textdrugList = drugElement.getChildNodes();
					ps.setString(1, ((Node) textdrugList.item(0))
							.getNodeValue().trim());

					// -------
					NodeList firstNameList = firstPersonElement
							.getElementsByTagName("PHARMACOLOGICALCLASS");
					Element firstNameElement = (Element) firstNameList.item(0);
					NodeList textFNList = firstNameElement.getChildNodes();
					ps.setString(2, ((Node) textFNList.item(0)).getNodeValue()
							.trim());

					NodeList lastNameList = firstPersonElement
							.getElementsByTagName("MECHANISMOFACTION");
					Element lastNameElement = (Element) lastNameList.item(0);
					NodeList textLNList = lastNameElement.getChildNodes();
					ps.setString(3, ((Node) textLNList.item(0)).getNodeValue()
							.trim());

					NodeList ageList = firstPersonElement
							.getElementsByTagName("USES");
					Element ageElement = (Element) ageList.item(0);
					NodeList textAgeList = ageElement.getChildNodes();
					ps.setString(4, ((Node) textAgeList.item(0)).getNodeValue()
							.trim());

					NodeList Dosage = firstPersonElement
							.getElementsByTagName("DOSAGE");
					Element DosageElement = (Element) Dosage.item(0);
					NodeList textDosageList = DosageElement.getChildNodes();
					ps.setString(5, ((Node) textDosageList.item(0))
							.getNodeValue().trim());

					NodeList activeList = firstPersonElement
							.getElementsByTagName("ACTIVE");
					Element activeElement = (Element) activeList.item(0);
					NodeList textactiveList = activeElement.getChildNodes();
					ps.setString(6, ((Node) textactiveList.item(0))
							.getNodeValue().trim());

					NodeList dateList = firstPersonElement
							.getElementsByTagName("DATE");
					Element dateElement = (Element) dateList.item(0);
					NodeList textdateList = dateElement.getChildNodes();
					ps.setString(7, ((Node) textdateList.item(0))
							.getNodeValue().trim());

					ps.executeUpdate();
				}// end of if clause

			}// end of for loop with s var

		} catch (SAXParseException err) {
			System.out.println("** Parsing error" + ", line "
					+ err.getLineNumber() + ", uri " + err.getSystemId());
			System.out.println(" " + err.getMessage());

		} catch (SAXException e) {
			Exception x = e.getException();
			((x == null) ? e : x).printStackTrace();

		} catch (Throwable t) {
			t.printStackTrace();
		}
	}

}
