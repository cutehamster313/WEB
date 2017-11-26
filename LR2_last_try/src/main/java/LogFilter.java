import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Arrays;

@WebFilter(urlPatterns = "/*", dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class LogFilter implements Filter {

    static Logger logger;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger = Logger.getLogger(LogFilter.class);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        StringBuilder parameters = new StringBuilder();
        servletRequest.getParameterMap().forEach((key, value) -> parameters.append((key + ": " + Arrays.toString(value) + ";")));
        logger.debug(servletRequest.getServerName() + "; Parameters {" + parameters + "}");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
