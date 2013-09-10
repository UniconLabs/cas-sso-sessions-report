package net.unicon.cas.ssosessions.report.controller

import groovy.util.logging.Slf4j
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import wslite.rest.RESTClient

@Controller
@RequestMapping("/")
@Slf4j
/**
 * A Spring MVC controller to fetch CAS SSO sessions report JSON payload from cas-addons REST endpoint running on the CAS server
 * and expose this data as a List of Maps representation to a JSP view, so it could render a pretty UI with it.
 *
 * @author Dmitriy Kopylenko
 * @author Unicon, inc.
 */
class ReportController {

    @RequestMapping(method = RequestMethod.GET)
    def index() {
        "index"
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    def getReport(@RequestParam("casUrl") String casUrl, ModelMap model) {
        try {
            def client = new RESTClient(casUrl)
            def response = client.get(path:'/sso-sessions')
            model.casSsoSessions = response.json.activeSsoSessions
            model.casServerUrl = casUrl
        }
        catch (Throwable e) {
            log.warn('An error is encountered during processing of the CAS SSO report request:', e)
            model.errorMsg = 'An error is encountered during processing of the CAS SSO report request. Please see server logs for details.'
        }
        "index"
    }
}
