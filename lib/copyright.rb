module Copyright

  def copyright_status_of(text)
    data = validated_data_of(text)

    copyright = {
      :us => ByCountry::us(data),
      :uk => ByCountry::uk(data),
      :au => ByCountry::au(data),
      :ca => ByCountry::ca(data),
      :fr => ByCountry::fr(data),
      :de => ByCountry::de(data)
    }
  end

  private

  module ByCountry
    extend self

    def us(data)
      true if Rules::us_before_1923(data[:published]) or Rules::us_between_1923_and_1963(data[:published], data[:renewal])
    end

    def uk(data)
      true if Rules::life_plus_70(data[:defunction]) or Rules::us_uk_between_1900_and_1920(data[:country], data[:defunction], data[:published], data[:renewal]) or Rules::us_uk_between_1921_and_1922(data[:country], data[:published]) or Rules::us_uk_between_1923_and_1927(data[:country], data[:defunction], data[:published], data[:renewal]) or Rules::us_uk_between_1928_and_1963(data[:country], data[:defunction], data[:published], data[:renewal])
    end

    def au(data)
      true if Rules::author_died_before_1955(data[:defunction])
    end

    def ca(data)
      true if Rules::life_plus_50(data[:defunction])
    end

    def fr(data)
      true if Rules::life_plus_70(data[:defunction])
    end

    def de(data)
      true if Rules::life_plus_70(data[:defunction])
    end

    module Rules
      extend self

      def life_plus_50(defunction)
        true if defunction and Time.now.year - defunction > 50
      end

      def life_plus_70(defunction)
        true if defunction and Time.now.year - defunction > 70
      end

      def author_died_before_1955(defunction)
        true if defunction and defunction < 1955
      end

      def us_before_1923(published)
        true if published and published < 1923
      end

      def us_between_1923_and_1963(published, renewal)
        true if published and published >= 1923 and published <= 1963 and !renewal
      end

      def us_uk_between_1900_and_1920(country, defunction, published, renewal)
        true if (published and country == "United States" and published >= 1900 and published <= 1920) and ((renewal and life_plus_50(defunction)) or !renewal)
      end

      def us_uk_between_1921_and_1922(country, published)
        true if published and country == "United States" and published <= 1921 and published >= 1922
      end

      def us_uk_between_1923_and_1927(country, defunction, published, renewal)
        true if (published and country == "United States" and published >= 1923 and published <= 1927) and ((renewal and life_plus_70(defunction)) or !renewal)
      end

      def us_uk_between_1928_and_1963(country, defunction, published, renewal)
        true if (published and country == "United States" and published >= 1928 and published <= 1963) and ((renewal and life_plus_70(defunction)) or (!renewal and life_plus_50(defunction)))
      end
    end
  end

  module Questions
    extend self

    def is_author_defunction?(text)
      true unless text.author_defunction.nil?
    end

    def is_published?(text)
      true unless text[:published].nil?
    end

    def is_renewal?(text)
      true unless text[:renewal].nil?
    end

    def is_translator?(text)
      true unless text.translator.nil?
    end

    def is_translator_defunction?(text)
      true unless !is_translator?(text) and text.translator[:defunction].nil?
    end

    def is_translation_published?(text)
      true unless text[:translation_published].nil?
    end

    def is_translation_renewal?(text)
      true unless !is_translation_published?(text) and text[:translation_renewal].nil?
    end
  end

  def validated_data_of(text)
    data = {}

    if Questions::is_translator?(text)
      data[:country] = text.translator[:country]

      if Questions::is_translator_defunction?(text)
        data[:defunction] = text.translator[:defunction]
      else
        data[:defunction] = false
      end

      if Questions::is_translation_published?(text)
        data[:published] = text[:translation_published]
      else
        data[:published] = false
      end

      if Questions::is_translation_renewal?(text)
        data[:renewal] = text[:translation_renewal]
      else
        data[:renewal] = false
      end

    else
      data[:country] = text.author[:country]

      if Questions::is_author_defunction?(text)
        data[:defunction] = text.author[:defunction]
      else
        data[:defunction] = false
      end

      if Questions::is_published?(text)
        data[:published] = text[:published]
      else
        data[:published] = false
      end

      if Questions::is_renewal?(text)
        data[:renewal] = text[:renewal]
      else
        data[:renewal] = false
      end
    end

    data
  end

end