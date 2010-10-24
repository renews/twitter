module Twitter
  class Client
    module List
      def list_create(screen_name, name, options={})
        authenticate!
        response = post("#{screen_name}/lists", options.merge(:name => name))
        format.to_s.downcase == 'xml' ? response.list : response
      end

      def list_update(screen_name, name, options={})
        authenticate!
        response = put("#{screen_name}/lists/#{name}", options)
        format.to_s.downcase == 'xml' ? response.list : response
      end

      def lists(*args)
        authenticate!
        options = args.last.is_a?(Hash) ? args.pop : {}
        screen_name = args.first
        if screen_name
          response = get("#{screen_name}/lists", options)
        else
          response = get('lists', options)
        end
        format.to_s.downcase == 'xml' ? response.lists_list : response
      end

      def list(screen_name, name, options={})
        authenticate!
        response = get("#{screen_name}/lists/#{name}", options)
        format.to_s.downcase == 'xml' ? response.list : response
      end

      def list_delete(screen_name, name, options={})
        authenticate!
        response = delete("#{screen_name}/lists/#{name}", options)
        format.to_s.downcase == 'xml' ? response.list : response
      end

      def list_timeline(screen_name, name, options={})
        authenticate!
        response = get("#{screen_name}/lists/#{name}/statuses", options)
        format.to_s.downcase == 'xml' ? response.statuses : response
      end

      def memberships(screen_name, options={})
        authenticate!
        response = get("#{screen_name}/lists/memberships", options)
        format.to_s.downcase == 'xml' ? response.lists_list : response
      end

      def subscriptions(screen_name, options={})
        authenticate!
        response = get("#{screen_name}/lists/subscriptions", options)
        format.to_s.downcase == 'xml' ? response.lists_list : response
      end
    end
  end
end
