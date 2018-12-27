package me.vitan.servlet;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckCode extends HttpServlet {
	public Color getRandColor(int s, int e) { // �����ȡ�����ɫ�ķ���
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r = s + random.nextInt(e - s); // �������RGB��ɫ�е�rֵ
		int g = s + random.nextInt(e - s); // �������RGB��ɫ�е�gֵ
		int b = s + random.nextInt(e - s); // �������RGB��ɫ�е�bֵ
		return new Color(r, g, b);
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ֹ����
		response.setHeader("Pragma", "No-cache");//����ָ��
		response.setHeader("Cache-Control", "No-cache");//�������
		response.setDateHeader("Expires", 0);//�������ڣ���ֹ����
		response.setContentType("image/jpeg");// ָ�����ɵ���Ӧ��ͼƬ
		int width = 100; // ָ����֤��Ŀ��
		int height = 30; // ָ����֤��ĸ߶�
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics(); // ��ȡGraphics��Ķ���
		Random random = new Random(); // ʵ����һ��Random����
		Font mFont = new Font("����", Font.ITALIC, 26); // ͨ��Font��������
		g.setColor(getRandColor(200, 250)); // ������ɫ
		g.fillRect(0, 0, width, height); // ������֤�뱳��
		g.setFont(mFont); // ��������
		g.setColor(getRandColor(180, 200)); // �������ֵ���ɫ
		String sRand = "";
		char ctmp;
		for (int i = 0; i < 4; i++) { // ����������֤����
			int char1=random.nextInt(3);
			if (char1==0) {
				ctmp = (char) (random.nextInt(26) + 65); // ����A~Z����ĸ
			}else if (char1==1) {
				 ctmp = (char) (random.nextInt(26) + 97); // ����a~z����ĸ
			}else {
				 ctmp = (char) (random.nextInt(9) + 49); // ����1~9����ĸ
			}
			
			//char ctmp = (char) (random.nextInt(25) + 65); // ����A~Z����ĸ
			
			sRand += ctmp;
			Color color = new Color(20 + random.nextInt(110),
					20 + random.nextInt(110), 20 + random.nextInt(110));
			g.setColor(color); // ������ɫ
			g.drawString(String.valueOf(ctmp), width / 6 * i + 23,
					height / 2 + 10);
		}
		HttpSession session = request.getSession(true);
		session.setAttribute("randCheckCode", sRand); // �����ɵ���֤�뱣�浽Session��
		g.dispose();//����
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}
