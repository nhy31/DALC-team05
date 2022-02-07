package dongduk.dalc05.aah.domain;

// DB x, only domain class
public class Media {
	
	private String url;
	private String title;
	private String image;
	private String source;
	private String time;
	
	public Media() {}
	
	public Media(String url, String title, String image, String source, String time) {
		super();
		this.url = url;
		this.title = title;
		this.image = image;
		this.source = source;
		this.time = time;
	}

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
