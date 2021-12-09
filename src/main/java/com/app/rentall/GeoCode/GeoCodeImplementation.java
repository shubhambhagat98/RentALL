package com.app.rentall.GeoCode;

import com.app.rentall.Model.LatAndLng;
import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class GeoCodeImplementation {

    private static final String URL = "https://maps.googleapis.com/maps/api/geocode/json";
    private static final String API_KEY = "AIzaSyBMBgnNGsl68y8KN5ATgoj_GlvI58NFDE8";

    public static LatAndLng getLatandLang(String address) throws java.io.IOException, JSONException {

        LatAndLng latAndLng = new LatAndLng();
        URL url = new URL(URL + "?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=false," + "CA&key=" + API_KEY);
        URLConnection connection = url.openConnection();
        ByteArrayOutputStream locationStream = new ByteArrayOutputStream(1024);
        IOUtils.copy(connection.getInputStream(), locationStream);
        locationStream.close();
        String locationData=locationStream.toString();
        final  JSONObject locationObj = new JSONObject(locationData);
        String latitude = locationObj.getJSONArray("results").getJSONObject(0).getJSONObject("geometry").getJSONObject("location").get("lat").toString();
        String longitude = locationObj.getJSONArray("results").getJSONObject(0).getJSONObject("geometry").getJSONObject("location").get("lng").toString();
        latAndLng.setLat(latitude);
        latAndLng.setLng(longitude);
//        System.out.println(latitude);
//        System.out.println(longitude);
        return latAndLng;
    }
}
