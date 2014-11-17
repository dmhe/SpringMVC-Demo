package com.study.dmhe.usermanage.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.ClassUtils;
import org.springframework.web.filter.OncePerRequestFilter;

public class MyCharacterEncodingFilter extends OncePerRequestFilter {

	private final static boolean responseSetCharacterEncodingAvailable = ClassUtils.hasMethod(
			HttpServletResponse.class, "setCharacterEncoding", new Class[] {String.class});


	private String encoding;

	private boolean forceEncoding = false;

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public void setForceEncoding(boolean forceEncoding) {
		this.forceEncoding = forceEncoding;
	}

	protected void doFilterInternal(
			HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		if (this.encoding != null && (this.forceEncoding || request.getCharacterEncoding() == null)) {
			request.setCharacterEncoding(this.encoding);
			if (this.forceEncoding && responseSetCharacterEncodingAvailable) {
				response.setCharacterEncoding(this.encoding);
			}
		}
		/*MyHttpServletRequestWrapper myHttpServletRequestWrapper = new MyHttpServletRequestWrapper(request);
		filterChain.doFilter(myHttpServletRequestWrapper, response);*/
	}

}
