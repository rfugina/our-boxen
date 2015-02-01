# Make the environment visible to puppet
# Useful to get ENV['USER'] et.al.
ENV.each do |k,v|
    Facter.add("env_#{k.downcase}".to_sym) do
        setcode do
            v
        end
    end
end
