class TestController < ApplicationController
  def search
    @catch=[]
    @courses=Course.find_all_by_year(2012, :order => "DEPT ASC")
    for c in @courses
      cond={}
      cond[:year]=c.year
      cond[:semester]=c.semester
      cond[:code]=c.code
      cond[:bunban]=c.bunban
      re=Course.find(:all, :conditions => cond)
      if re.size!=1
        for r in re
          @catch<<r
        end

      end
    end

  end
end
