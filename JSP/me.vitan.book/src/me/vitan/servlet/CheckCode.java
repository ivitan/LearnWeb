package me.vitan.servlet;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckCode extends HttpServlet {
	public Color getRandColor(int s, int e) { // 定义获取随机颜色的方法
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r = s + random.nextInt(e - s); // 随机生成RGB颜色中的r值
		int g = s + random.nextInt(e - s); // 随机生成RGB颜色中的g值
		int b = s + random.nextInt(e - s); // 随机生成RGB颜色中的b值
		return new Color(r, g, b);
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 禁止缓存
		response.setHeader("Pragma", "No-cache");//编译指令
		response.setHeader("Cache-Control", "No-cache");//缓存控制
		response.setDateHeader("Expires", 0);//立即过期，防止缓存
		response.setContentType("image/jpeg");// 指定生成的响应是图片
		int width = 100; // 指定验证码的宽度
		int height = 30; // 指定验证码的高度
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics(); // 获取Graphics类的对象
		Random random = new Random(); // 实例化一个Random对象
		Font mFont = new Font("宋体", Font.ITALIC, 26); // 通过Font构造字体
		g.setColor(getRandColor(200, 250)); // 设置颜色
		g.fillRect(0, 0, width, height); // 绘制验证码背景
		g.setFont(mFont); // 设置字体
		g.setColor(getRandColor(180, 200)); // 设置文字的颜色
		String sRand = "";
		char ctmp;
		for (int i = 0; i < 4; i++) { // 输出随机的验证文字
			int char1=random.nextInt(3);
			if (char1==0) {
				ctmp = (char) (random.nextInt(26) + 65); // 生成A~Z的字母
			}else if (char1==1) {
				 ctmp = (char) (random.nextInt(26) + 97); // 生成a~z的字母
			}else {
				 ctmp = (char) (random.nextInt(9) + 49); // 生成1~9的字母
			}
			
			//char ctmp = (char) (random.nextInt(25) + 65); // 生成A~Z的字母
			
			sRand += ctmp;
			Color color = new Color(20 + random.nextInt(110),
					20 + random.nextInt(110), 20 + random.nextInt(110));
			g.setColor(color); // 设置颜色
			g.drawString(String.valueOf(ctmp), width / 6 * i + 23,
					height / 2 + 10);
		}
		HttpSession session = request.getSession(true);
		session.setAttribute("randCheckCode", sRand); // 将生成的验证码保存到Session中
		g.dispose();//处理
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}
