class ChargeIO::Account < ChargeIO::Base

  def merchant
    gateway.merchant
  end

  def primary?
    attributes['primary']
  end

  def charges
    gateway.charges(:account_id => id)
  end

  def authorize(amount, params={})
    gateway.authorize(amount, params.merge(:account_id => id))
  end

  def charge(amount, params={})
    gateway.charge(amount, params.merge(:account_id => id))
  end

  def save
    res = gateway.update_account(id, attributes)
    replace(res)
  end
end

