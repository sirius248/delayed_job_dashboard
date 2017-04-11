module VueDelayedJobDashboard
  class Filter
    def self.for(jobs, filter)
      case filter
      when "pending"
        jobs.where(locked_at: nil, attempts: 0)
      when "failed"
        jobs.where.not(failed_at: nil)
      when "working"
        jobs.where.not(locked_at: nil)
      when "enqueued"
        jobs
      when nil || ""
        jobs
      end
    end
  end
end
