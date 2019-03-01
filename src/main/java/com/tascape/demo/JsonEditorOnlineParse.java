/*
 * Copyright (c) 2015 - present Nebula Bay.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.tascape.demo;

import com.tascape.demo.driver.JsonEditorOnline;
import com.tascape.demo.driver.PageJsonEditorHome;
import com.tascape.demo.suite.JsonEditorOnlineSuite;
import com.tascape.reactor.driver.CaseDriver;
import com.tascape.reactor.task.AbstractCase;
import java.time.LocalDateTime;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author linsong wang
 */
public class JsonEditorOnlineParse extends AbstractCase {
    private static final Logger LOG = LoggerFactory.getLogger(JsonEditorOnlineSuite.class);

    public static final CaseDriver DRIVER_JSON_EDITOR = new CaseDriver(JsonEditorOnlineParse.class,
        JsonEditorOnline.class);

    private final JsonEditorOnline editor;

    public JsonEditorOnlineParse() {
        this.editor = super.getEntityDriver(DRIVER_JSON_EDITOR);
    }

    @Override
    public String getApplicationUnderTask() {
        return editor.getName();
    }

    @Before
    public void setup() throws Exception {
        editor.takeBrowserScreenshot();
        editor.getWebBrowser().setDefaultTimeouts();
    }

    @Test
    public void parseJson() throws Exception {
        LOG.info("create a sample json string");
        JSONObject json = new JSONObject()
            .put("name", "automated test")
            .put("time", LocalDateTime.now().toString());
        LOG.debug("{}", json.toString());

        LOG.info("Enter json string, and click right-arrow button");
        PageJsonEditorHome home = editor.home();
        home.parseJson(json.toString());

        LOG.info("Verify there is no error message on page");
        Assert.assertTrue("Error message found on page", home.hasNoError());
    }

    @Test
    public void showInDiffScreenResolutions() throws Exception {
        PageJsonEditorHome home = editor.home();
        editor.getWebBrowser().takeBrowserScreenshots();
    }
}
