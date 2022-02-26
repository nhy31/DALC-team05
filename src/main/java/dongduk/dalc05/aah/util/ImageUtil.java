package dongduk.dalc05.aah.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

@Configuration
public class ImageUtil {

	public String uploadImage(HttpServletRequest request, MultipartFile file) {
		// 파일이 업로드 경로
		String saveDir = request.getServletContext().getRealPath("/images");
		System.out.println(saveDir);

		System.out.println(saveDir);
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		String filePath = "";

		if(file == null)
			return null;
		
		if (!file.isEmpty()) {
			String orifileName = file.getOriginalFilename();
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");

			int rand = (int) (Math.random() * 1000);
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;

			try {
				filePath = saveDir + "/" + reName;
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			return reName;
		}

		return null;
	}

}
