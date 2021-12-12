//
//  URLStringGenerator.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

enum URLStringGenerator {
    static private func generatePath(for resource: String?, root: String, apiVersion: String?) -> String {
        var url = root

        if let apiVersion = apiVersion {
            url += "/" + apiVersion
        }

        if let resource = resource {
            url += "/" + resource
        }

        return url
    }

    static func resource(_ resource: String?, root: String, apiVersion: String?) -> ([String]) -> String {
        return { (components: [String]) in
            var uri = generatePath(for: resource, root: root, apiVersion: apiVersion)

            if !components.isEmpty {
                uri += "/" + components.joined(separator: "/")
            }

            return uri
        }
    }
}

